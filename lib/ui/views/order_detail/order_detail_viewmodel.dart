import 'package:rider/app/app.locator.dart';
import 'package:rider/app/app.router.dart';
import 'package:rider/responses/order_response.dart';
import 'package:rider/services/database_service.dart';
import 'package:rider/services/location_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OrderDetailViewModel extends BaseViewModel {
  final navService = locator<NavigationService>();
  final dbService = locator<DatabaseService>();
  final _locationService = locator<LocationService>();

  OrderDetailViewModel() {
    // getCurrentOrderDetail();
  }

  back() {
    navService.back();
  }

  navigateToOnWay(order) {
    navService.navigateToOnWayView(order: order);
  }

  //
  double findDistance(OrderModel order) {
    GeoLocation location1 = GeoLocation(
        double.parse(order.restaurant?.latitude.toString() ?? "0.0"),
        double.parse(order.restaurant?.longitude.toString() ??
            "0.0")); // Example coordinates for New York City
    // GeoLocation(40.7128, -74.0060); // Example coordinates for New York City
    GeoLocation location2 = GeoLocation(
        double.parse(order.deliveryAddressObj?.lat?.toString() ?? "0.0"),
        double.parse(order.deliveryAddressObj?.lang?.toString() ??
            "0.0")); // Example coordinates for Los Angeles
    // GeoLocation(34.0522, -118.2437); // Example coordinates for Los Angeles
    return _locationService.findDistance(
        location1: location1, location2: location2);
  }

  // ActiveRideOrder? order;
  // Future<void> getCurrentOrderDetail() async {
  //   setBusy(true);
  //   CurrentRideResponse res = await dbService.getCurrentRideInfo();
  //   print(res);
  //   if (res.success) {
  //     order = res.body!;
  //   } else {
  //     //
  //   }
  //   setBusy(false);
  // }
}
