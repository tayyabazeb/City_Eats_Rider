import 'package:rider/app/app.dialogs.dart';
import 'package:rider/app/app.locator.dart';
import 'package:rider/app/app.router.dart';
import 'package:rider/responses/order_response.dart';
import 'package:rider/services/database_service.dart';
import 'package:rider/services/location_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class IncomnigrequestDialogModel extends BaseViewModel {
  final _navService = locator<NavigationService>();
  final _dbService = locator<DatabaseService>();
  final _dialogService = locator<DialogService>();
  final _locationService = locator<LocationService>();
  late OrderModel order;

  IncomnigrequestDialogModel(this.order);

  ///
  navigateToJobView() {
    _navService.navigateToJobAcceptView();
  }

  navigateToOrderDetail() {
    _navService.navigateToRideView(order: order);
  }

  Future<bool> acceptRide(int orderId) async {
    setBusy(true);
    final res = await _dbService.acceptOrder(orderId);
    if (res['success']) {
      return true;
    } else {
      showDialog(res['error']);
    }
    setBusy(false);
    return false;
  }

  showDialog(String error) {
    _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Error',
      description: error,
    );
  }

  // "${viewModel.findDistance().toStringAsFixed(2)} kms",
  double findDistance() {
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
}
