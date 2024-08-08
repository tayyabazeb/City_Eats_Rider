import 'package:rider/responses/address_response.dart';
import 'package:stacked/stacked.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rider/app/app.dialogs.dart';
import 'package:rider/app/app.router.dart';
import 'package:rider/models/address_body.dart';
import 'package:rider/services/database_service.dart';
import 'package:rider/services/location_service.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import 'edit_address_view.form.dart';

class EditAddressViewModel extends FormViewModel {
  bool isButtonClicked = false;
  final _navService = locator<NavigationService>();
  final _dbService = locator<DatabaseService>();
  final _dialogService = locator<DialogService>();
  final _locationService = locator<LocationService>();

  EditAddressViewModel() {
    getAddress();
  }

  Address address = Address(
    street: '',
    building: '',
    city: '',
    state: '',
    zipCode: '',
    lat: 0,
    lng: 0,
  );

  buttonClick() {
    isButtonClicked = true;
    notifyListeners();
  }

  AddressObject? addressObject;
  Future<void> getAddress() async {
    setBusy(true);
    AddressResponse res = await _dbService.fetchMyAddress();
    if (res.success) {
      addressObject = res.body;
      syncData();
    } else {
      showDialog(res.error ?? "");
    }
    setBusy(false);
  }

  syncData() {
    streetValue = addressObject?.address;
    stateValue = addressObject?.state;
    zipCodeValue = addressObject?.zipCode;
    cityValue = addressObject?.city;
    // streetValue = addressObject?.;
    address.building = addressObject?.apt ?? "";
    address.city = addressObject?.city ?? "";
    address.street = addressObject?.address ?? "";
    address.zipCode = addressObject?.zipCode ?? "";
    address.state = addressObject?.state ?? "";
  }

  Future<void> updateAddress() async {
    setBusy(true);
    final res = await _dbService.updateAddress(address);
    if (res['success']) {
      // navigateToWaitingScreen();
      back();
    } else {
      showDialog(res['error']);
    }
    setBusy(false);
  }

  getCurrentLocation() async {
    Position? position = await _locationService.getCurrentLocation();
    if (position != null) {
      address.lat = position.latitude;
      address.lng = position.longitude;
    }
    rebuildUi();
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

  back() {
    _navService.back();
  }
}
