import 'package:rider/services/notification_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rider/app/app.router.dart';
import 'package:rider/models/address_body.dart';
import 'package:rider/models/user_profile.dart';
import 'package:rider/services/auth_service.dart';
import 'package:rider/services/database_service.dart';
import 'package:rider/services/location_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.dialogs.dart';
import '../../../app/app.locator.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _authService = locator<AuthService>();
  final navService = locator<NavigationService>();
  final _dbService = locator<DatabaseService>();
  final _notificationService = locator<NotificationService>();

  UserProfile? userProfile;
  bool isOnline = false;

  HomeViewModel() {
    init();
    askNotificationPermissions();
  }

  init() async {
    userProfile = _authService.userProfile ?? await _authService.getUserProfile;
    status = userProfile?.userOnline ?? 0;
    isOnline = (userProfile!.userOnline == 1) ? true : false;
    rebuildUi();
    getCurrentLocation();
    getHomeData();
  }

  Future<void> toggleStatus(newValue) async {
    isOnline == newValue;
    rebuildUi();
    await toggleOnlineOffline();
    print(isOnline);
  }

  askNotificationPermissions() async {
    await _notificationService.askPermission();
  }

  // showIncomingRequestDialog() {
  //   _dialogService.showCustomDialog(
  //     variant: DialogType.incomnigrequest,
  //     title: 'Error',
  //     description: "",
  //   );
  // }
  bool get notVerified => checkStatus();

  checkStatus() {
    if (_authService.userProfile?.isDocumentsVerified == 0) {
      return true;
    }
    return false;
  }

  showWaitingDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.notApproved,
    );
  }

  int status = 0;
  bool isSwitching = false;

  Future<void> toggleOnlineOffline() async {
    isSwitching = true;
    rebuildUi();
    final res = await _dbService.onlineOffline(status == 0 ? 1 : 0);
    if (res['success'] ?? false) {
      if (status == 0) {
        status = 1;
      } else {
        status = 0;
      }
    } else {
      ///
    }
    isSwitching = false;
    rebuildUi();
  }

  Future<void> getRequestOrder() async {
    final res = await _dbService.getRequestOrder();
    if (res.success) {
    } else {
      ///
    }

    rebuildUi();
  }

  int activeOrders = 0;
  double earnings = 0;
  int history = 0;
  double ratings = 0;

  Future<void> getHomeData() async {
    print(status);
    setBusy(true);
    final res = await _dbService.getHomeData();
    if (res.success) {
      activeOrders = res.data['body']['active_orders'] ?? 0;
      earnings = double.parse((res.data['body']['earnings'] ?? 0).toString());
      history = res.data['body']['history'] ?? 0;
      ratings = double.parse((res.data['body']['ratings'] ?? 0).toString());
    } else {
      ///
    }
    setBusy(false);
  }

  navigateToHistoryView() async {
    navService.navigateToMyOrdersView();
  }

  navigateToRideView() {
    navService.navigateToRideView();
  }

  navigateToEarningView() {
    navService.navigateToEarningView();
  }

  navigateToProfileSettingsView() async {
    await navService.navigateToProfileSettingsView();
    userProfile = _authService.userProfile ?? await _authService.getUserProfile;
    rebuildUi();
  }

  navigateToRatingView() {
    navService.navigateToRatingsView();
  }

  final _locationService = locator<LocationService>();
  Address address = Address(
    street: '',
    building: '',
    city: '',
    state: '',
    zipCode: '',
    lat: 0,
    lng: 0,
  );

  Future<void> updateAddress() async {
    // setBusy(true);
    final res =
        await _dbService.updateAddressFromHome(address.lat, address.lng);
    if (res['success'] ?? false) {
      // navigateToWaitingScreen();
      // back();
    } else {
      // showDialog(res['error']);
    }
    // setBusy(false);
  }

  getCurrentLocation() async {
    Position? position = await _locationService.getCurrentLocation();
    if (position != null) {
      address.lat = position.latitude;
      address.lng = position.longitude;
      updateAddress();
    }
    rebuildUi();
  }
}
