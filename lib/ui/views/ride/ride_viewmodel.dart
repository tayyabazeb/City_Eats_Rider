import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rider/app/app.bottomsheets.dart';
import 'package:rider/app/app.dialogs.dart';
import 'package:rider/app/app.logger.dart';
import 'package:rider/app/app.router.dart';
import 'package:rider/responses/active_order_response.dart';
import 'package:rider/responses/order_response.dart';
import 'package:rider/services/location_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../app/app.locator.dart';
import '../../../services/database_service.dart';

class RideViewModel extends BaseViewModel {
  final _navService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final dbService = locator<DatabaseService>();
  final _locationService = locator<LocationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  RideStatus rideStatus = RideStatus.onWay;
  String statusText = "On the way to Pickup...";
  String buttonText = "I have Arrived";
  String callButtonText = "Call Sender";

  List<Marker> markerList = [];
  LatLngBounds? _bounds;
  List<Polyline> polyLineList = [];
  OrderModel? order;

  // final LatLng _firstMarkerPosition = LatLng(37.7749, -122.4194);
  // final LatLng _secondMarkerPosition = LatLng(40.7128, -74.0060);
  // final LatLng _initialPosition =
  //     const LatLng(37.7749, -122.4194); // San Francisco

  GoogleMapController? mapController;

  ///
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  static const CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Position? currentPosition;

  RideViewModel(this.order) {
    // _firstMarkerPosition = _initialPosition;
    // _secondMarkerPosition = _initialPosition;
    if (order != null) {
      rideStatus = RideStatus.pending;
    } else {
      getCurrentOrderDetail();
    }
    getCurrentLocation();
    rebuildUi();
  }
  Duration duration = const Duration();

  getCurrentLocation() async {
    Position? position = await _locationService.getCurrentLocation();
    if (position != null) {
      currentPosition = position;
    }
    findDuration();
    rebuildUi();
  }

  findDuration() {
    duration = calculateTravelDuration(currentPosition?.latitude ?? navLat,
        currentPosition?.longitude ?? navLng, navLat, navLng, 40);

    rebuildUi();
  }

  Future<void> acceptRide(int orderId) async {
    setBusy(true);
    final res = await dbService.acceptOrder(orderId);
    if (res['success']) {
      // return true;
      rideStatus = RideStatus.onWay;
      getCurrentOrderDetail();
    } else {
      await showDialog(res['error']);
      _navService.clearStackAndShow(Routes.homeView);
    }
    setBusy(false);
    // return false;
  }

  // "${viewModel.findDistanceLocally().toStringAsFixed(2)} kms",
  double findDistanceLocally() {
    GeoLocation location1 = GeoLocation(
        double.parse(order?.restaurant?.latitude.toString() ?? "0.0"),
        double.parse(order?.restaurant?.longitude.toString() ??
            "0.0")); // Example coordinates for New York City
    // GeoLocation(40.7128, -74.0060); // Example coordinates for New York City
    GeoLocation location2 = GeoLocation(
        double.parse(order?.deliveryAddressObj?.lat?.toString() ?? "0.0"),
        double.parse(order?.deliveryAddressObj?.lang?.toString() ??
            "0.0")); // Example coordinates for Los Angeles
    // GeoLocation(34.0522, -118.2437); // Example coordinates for Los Angeles
    return _locationService.findDistance(
        location1: location1, location2: location2);
  }

  Future<void> arriveAtPickUp({bool updateDb = true}) async {
    statusText = "On the way to dropoff...";
    buttonText = "Arrived at Dropoff";
    callButtonText = "Call Receiver";

    ///api call here
    ///
    if (updateDb) await updateRideStatusDatabase("arrived_at_pickup");
    updateRideStatusOnArriveAtRestaurant();
    initMapMarkerPolylineFitBoundAndAnimate();
    findDuration();

    rebuildUi();
  }

  Future<void> updateRideStatusDatabase(String status) async {
    setBusy(true);
    OrderModel order =
        await dbService.updateRideStatus(this.order!.id!, status);
    // if (res.success) {
    //
    // res.body;
    this.order = order;
    // } else {
    //
    // }
    setBusy(false);
  }

  updateRideStatusOnArriveAtRestaurant() {
    rideStatus = RideStatus.arrivedAtPickup;
    updateLatLngForNavigation(
      order?.deliveryAddressObj?.lat ?? 0.0,
      order?.deliveryAddressObj?.lang ?? 0.0,
      // double.parse(order?.deliveryAddressObj?.lat ?? "0.0"),
      // double.parse(order?.deliveryAddressObj?.lang ?? "0.0")
    );
    rebuildUi();
  }

  Future<void> arriveAtDropOff() async {
    await updateRideStatusDatabase("arrived_at_dropoff");

    await updateRideStatusDatabase("completed");
    rideStatus = RideStatus.complete;

    _navService.replaceWithJobCompletedView(
        earnings: (order?.riderCharges ?? '5.0').toString());
  }

  void navigateToDetail() {
    // _navService.navigateToOrderDetailView(order: order);
    _navService.navigateToSpecificOrderView(
        order: order!, isRouteFromRide: true);
  }

  void onMapCreated(GoogleMapController mapController) {
    controller.complete(mapController);
    this.mapController = mapController;
  }

  initMapMarkerPolylineFitBoundAndAnimate() async {
    if (currentPosition == null) await getCurrentLocation();
    initMarkers();
    addPolyLine();
    // Calculate bounds
    // _bounds = _getBounds();
    _bounds = boundsFromLatLngList([
      LatLng(currentPosition?.latitude ?? navLat,
          currentPosition?.longitude ?? navLng),
      LatLng(navLat, navLng)
    ]);
    _animateToTarget();
    _fitBounds();

    rebuildUi();
  }

  void initMarkers() {
    markerList.clear();
    markerList = [
      // List of Markers Added on Google Map
      Marker(
          markerId: const MarkerId('1'),
          position: LatLng(currentPosition?.latitude ?? navLat,
              currentPosition?.longitude ?? navLng),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: const InfoWindow(title: 'My position')),
      Marker(
          markerId: const MarkerId('2'),
          position: LatLng(navLat, navLng),
          infoWindow: InfoWindow(
              title: rideStatus == RideStatus.onWay
                  ? 'Restaurant position'
                  : 'Customer position')),
    ];
    rebuildUi();
  }

  void addPolyLine() {
    polyLineList.clear();
    Polyline polyline = Polyline(
      polylineId: const PolylineId('polyline'),
      color: Colors.black,
      width: 2,
      points: [
        LatLng(currentPosition?.latitude ?? navLat,
            currentPosition?.longitude ?? navLng),
        LatLng(navLat, navLng),
      ],
    );
    polyLineList.add(polyline);
    rebuildUi();
  }

  void _animateToTarget() async {
    await mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(
          LatLng(currentPosition?.latitude ?? navLat,
              currentPosition?.longitude ?? navLng),
          8.0),
    );
  }

  // LatLngBounds _getBounds() {
  //   LatLngBounds builder = LatLngBounds(northeast: null, southwest: null);
  //   markerList.forEach((marker) {
  //     builder.include(marker.position);
  //   });
  //   return builder.build();
  // }

  LatLngBounds boundsFromLatLngList(List<LatLng> list) {
    assert(list.isNotEmpty);
    double? x0, x1, y0, y1;

    for (LatLng latLng in list) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > (x1 ?? 0)) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > (y1 ?? 0)) y1 = latLng.longitude;
        if (latLng.longitude < (y0 ?? 0)) y0 = latLng.longitude;
      }
    }
    return LatLngBounds(
        northeast: LatLng((x1 ?? 0), (y1 ?? 0)),
        southwest: LatLng((x0 ?? 0), (y0 ?? 0)));
  }

  void _fitBounds() {
    if (_bounds != null) {
      mapController?.animateCamera(CameraUpdate.newLatLngBounds(_bounds!, 50));
    }
  }

  void openMessagingApp() async {
    String uri = rideStatus == RideStatus.onWay
        ? 'sms:${order?.restaurant?.phone ?? ""}'
        : 'sms:${order?.user?.contactNumber ?? ""}';
    if (await canLaunchUrl(Uri.parse(uri))) {
      await launchUrl(Uri.parse(uri));
    } else {
      print('Could not launch $uri');
    }
  }

  void onCallApp() async {
    String uri = rideStatus == RideStatus.onWay
        ? 'tel:${order?.restaurant?.phone ?? ""}'
        : 'tel:${order?.user?.contactNumber ?? ""}';
    // Scheme for opening SMS app
    if (await canLaunchUrl(Uri.parse(uri))) {
      await launchUrl(Uri.parse(uri));
    } else {
      print('Could not launch $uri');
    }
  }

  double navLat = 37.7749;
  double navLng = -122.4194;

  showMapBottomSheet() {
    _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.mapNavigationOption,
        isScrollControlled: true,
        data: {
          'latitude': navLat,
          'longitude': navLng,
        });
  }

  Future<void> getCurrentOrderDetail() async {
    setBusy(true);
    CurrentRideResponse res = await dbService.getCurrentRideInfo();
    if (res.success) {
      if (res.body != null) {
        order = res.body!;

        updateLatLngForNavigation(
            double.parse(order?.restaurant?.latitude ?? "0.0"),
            double.parse(order?.restaurant?.longitude ?? "0.0"));
        getLogger("get current order detail").wtf(order?.orderStatus);
        if (order?.orderStatus == "pending") {
          //
          rideStatus = RideStatus.pending;
          rebuildUi();
        } else if (order?.orderStatus == "arrived_at_pickup") {
          //
          arriveAtPickUp(updateDb: false);
        }

        ///
        initMapMarkerPolylineFitBoundAndAnimate();
      }
    } else {
      ///
      showDialog(res.error ?? "");
    }
    getLogger("get current order detail").wtf(rideStatus);
    setBusy(false);
  }

//
  // calculateDuration(String origin, String dest) {
  //   return _locationService.calculateDurationText(origin, dest);
  // }

  //
  double findDistance() {
    GeoLocation location1 = GeoLocation(
        37.7749, -122.4194); // Example coordinates for New York City
    // GeoLocation(40.7128, -74.0060); // Example coordinates for New York City
    GeoLocation location2 =
        GeoLocation(37.7749, -122.4194); // Example coordinates for Los Angeles
    // GeoLocation(34.0522, -118.2437); // Example coordinates for Los Angeles
    return _locationService.findDistance(
        location1: location1, location2: location2);
  }

  showDialog(String error) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: "Error",
      description: error,
    );
  }

  //
  updateLatLngForNavigation(double lat, double lng) {
    navLat = lat;
    navLng = lng;
    rebuildUi();
  }

// Function to calculate travel duration between two locations
  Duration calculateTravelDuration(double startLat, double doubleStartLng,
      double endLat, double endLng, double averageSpeedKmph) {
    double distance =
        calculateDistance(startLat, doubleStartLng, endLat, endLng);
    double timeInHours = distance / averageSpeedKmph;
    int timeInSeconds =
        (timeInHours * 3600).round(); // Convert hours to seconds
    return Duration(seconds: timeInSeconds);
  }

  // Function to calculate distance between two locations
  double calculateDistance(
      double startLat, double doubleStartLng, double endLat, double endLng) {
    const double earthRadius = 6371.0; // Earth's radius in kilometers

    // Convert latitude and longitude from degrees to radians
    double startLatRad = radians(startLat);
    double startLonRad = radians(doubleStartLng);
    double endLatRad = radians(endLat);
    double endLonRad = radians(endLng);

    // Calculate the change in coordinates
    double deltaLat = endLatRad - startLatRad;
    double deltaLon = endLonRad - startLonRad;

    // Haversine formula
    double a = pow(sin(deltaLat / 2), 2) +
        cos(startLatRad) * cos(endLatRad) * pow(sin(deltaLon / 2), 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    // Calculate the distance
    double distance = earthRadius * c;

    return distance;
  }

// Function to convert degrees to radians
  double radians(double degrees) {
    return degrees * pi / 180.0;
  }
}

enum RideStatus {
  pending,
  onWay,
  arrivedAtPickup,
  arrivedAtDropDown,
  complete,
}
