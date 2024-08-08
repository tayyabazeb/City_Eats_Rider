import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'package:rider/app/app.logger.dart';
import 'package:rider/models/location_body.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationService {
  final log = getLogger('LocationService');

  Position? currentLocation;
  double? latitude;
  double? longitude;

  Future<Position?> getCurrentLocation() async {
    // Test if location services are enabled.
    LocationPermission permission = await Geolocator.checkPermission();
    // Location services are not enabled don't continue
    // accessing the position and request users
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
          Exception('Location permissions are permanently denied.'),
        );
      }
    }

    // ignore: unrelated_type_equality_checks
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error(Exception('Location permissions are denied.'));
    }

    currentLocation = await Geolocator.getCurrentPosition();
    log.d(
        'Latitude: ${currentLocation!.latitude}, Longitude: ${currentLocation!.longitude}');
    return currentLocation;
  }

  double calculateDistance(GeoLocation location1, GeoLocation location2) {
    const double earthRadius = 6371.0; // Earth radius in kilometers

    double toRadians(double degree) {
      return degree * (pi / 180.0);
    }

    double lat1 = toRadians(location1.latitude);
    double lon1 = toRadians(location1.longitude);
    double lat2 = toRadians(location2.latitude);
    double lon2 = toRadians(location2.longitude);

    double dlat = lat2 - lat1;
    double dlon = lon2 - lon1;

    double a =
        pow(sin(dlat / 2), 2) + cos(lat1) * cos(lat2) * pow(sin(dlon / 2), 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    double distance = earthRadius * c; // Distance in kilometers

    return distance;
  }

  findDistance(
      {required GeoLocation location1, required GeoLocation location2}) {
    // GeoLocation location1 =
    //     GeoLocation(40.7128, -74.0060); // Example coordinates for New York City
    // GeoLocation location2 =
    //     GeoLocation(34.0522, -118.2437); // Example coordinates for Los Angeles

    double distance = calculateDistance(location1, location2);

    print(
        'Distance between the two locations: ${distance.toStringAsFixed(2)} km');
    return distance;
  }

  Future<LocationBody?> getAddressFromLatLng(LatLng? location) async {
    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(
          location!.latitude, location.longitude);

      Placemark place = placeMarks[0];

      String address = '';
      if (place.thoroughfare != null && place.thoroughfare != '') {
        address += '${place.thoroughfare}, ';
      }
      if (place.subLocality != null && place.subLocality != '') {
        address += '${place.subLocality}, ';
      }
      if (place.locality != null && place.locality != '') {
        address += '${place.locality}, ';
      }
      if (place.country != null && place.country != '') {
        address += '${place.country}';
      }

      // Remove any trailing commas or whitespace
      address = address.replaceAll(RegExp(r',\s*$'), '');

      LocationBody locationBody = LocationBody(
        postalCode: place.postalCode,
        lat: location.latitude,
        lng: location.longitude,
        streetAddress: place.street,
        name: place.locality,
      );
      locationBody.fullAddress = address;

      return locationBody;
    } catch (e) {
      log.d("@getAddressFromLatLng Error $e");
      return null;
    }
  }

  calculateDurationText(String origin, String destination) async {
    // Example: Replace with your origin and destination coordinates
    log.wtf(origin);
    log.wtf(destination);

    // Replace with your Google Maps API Key
    String apiKey = 'AIzaSyDctuzto9wPKyNWOom0Apn_yfdJt4LTgGU';

    // Build the URL for Directions API
    String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&key=$apiKey';

    // Make a GET request to Directions API
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      log.wtf("data ===== > $data");
      // setState(() {
      // Parse the estimated time from the response
      if (data['routes'] != []) {
        log.wtf(
            "duration ====> ${data['routes'][0]['legs'][0]['duration']['text']}");
        return data['routes'][0]['legs'][0]['duration']['text'];
      }
      // });
    } else {
      throw Exception('Failed to load directions');
    }
    return '0';
  }
}

class GeoLocation {
  final double latitude;
  final double longitude;

  GeoLocation(this.latitude, this.longitude);
}
