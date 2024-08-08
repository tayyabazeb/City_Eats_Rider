import 'package:geolocator/geolocator.dart';
import 'package:rider/app/app.dialogs.dart';
import 'package:rider/app/app.router.dart';
import 'package:rider/models/address_body.dart';
import 'package:rider/services/database_service.dart';
import 'package:rider/services/location_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class AddressViewModel extends FormViewModel {
  bool isButtonClicked = false;
  final _navService = locator<NavigationService>();
  final _dbService = locator<DatabaseService>();
  final _dialogService = locator<DialogService>();
  final _locationService = locator<LocationService>();

  Address address = Address(
      street: '',
      building: '',
      city: '',
      state: '',
      zipCode: '',
      lat: 0,
      lng: 0);

  buttonClick() {
    isButtonClicked = true;
    notifyListeners();
  }

  Future<void> addAddress() async {
    setBusy(true);
    final res = await _dbService.addAddress(address);
    if (res['success']) {
      navigateToWaitingScreen();
    } else {
      showDialog(res['error']);
    }
    setBusy(false);
  }

  showDialog(String error) {
    _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Error',
      description: error,
    );
  }

  navigateToWaitingScreen() {
    // _navService.replaceWithAddressView();
    _navService.clearStackAndShow(Routes.approvalView);
  }

  getCurrentLocation() async {
    Position? position = await _locationService.getCurrentLocation();
    if (position != null) {
      address.lat = position.latitude;
      address.lng = position.longitude;
    }
    rebuildUi();
  }
}
