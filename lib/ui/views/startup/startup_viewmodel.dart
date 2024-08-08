import 'package:rider/app/app.dialogs.dart';
import 'package:rider/services/auth_service.dart';
import 'package:rider/services/local_storage_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:rider/services/notification_service.dart';
import 'package:stacked/stacked.dart';
import 'package:rider/app/app.locator.dart';
import 'package:rider/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _localStorageService = locator<LocalStorageService>();

  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();
  final _notificationService = locator<NotificationService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    _initialSetup();
  }

  _initialSetup() async {
    await _localStorageService.init();

    // /
    // / If not connected to internet, show an alert dialog
    // / to activate the network connection.
    // /
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      _showDialog();
      return;
    }

    ///
    ///setup profile, get token, update token
    ///
    await _authService.doSetup();

    // if (_localStorageService.onBoarding) {
    ///
    if (_authService.isLogin) {
      ///otp
      if (_authService.userProfile?.verified == 0) {
        _navigationService.replaceWithEmailVerificationView(
            email: _authService.userProfile?.email ?? "");
      } else {
        ///documents vehicles
        // if (_authService.userProfile?.isDocumentsVerified == 0) {
        // _navigationService.replaceWithApprovalView();
        // }
        // else
        if (_authService.userProfile?.isVehicleAdded == 0) {
          _navigationService.replaceWithUploadVehicleDetailsView();
        } else if (_authService.userProfile?.isLicenseAdded == 0) {
          _navigationService.replaceWithIdentityVerificationView();
        } else if (_authService.userProfile?.isAddressAdded == 0) {
          _navigationService.replaceWithAddressView();
        }
        // else if (_authService.userProfile?.riderBusy == 1) {
        //   _navigationService.replaceWithRideView();
        // }
        else {
          _navigationService.replaceWithHomeView();
          // _navigationService.replaceWithUploadVehicleDetailsView();
        }
      }
    } else {
      await Future.delayed(const Duration(seconds: 2));
      _navigationService.replaceWithLoginView();
    }

    //
    await _notificationService.initConfigure();
  }

  _showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.noInternet,
      title: 'No Internet',
      description:
          "You have no internet connection! please connect to internet",
    );
  }
}
