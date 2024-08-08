// ignore_for_file: use_build_context_synchronously

import 'package:rider/app/app.dialogs.dart';
import 'package:rider/app/app.locator.dart';
import 'package:rider/app/app.logger.dart';
import 'package:rider/app/app.router.dart';
import 'package:rider/models/auth_models/login_body.dart';
import 'package:rider/responses/auth_response.dart';
import 'package:rider/services/auth_service.dart';
import 'package:rider/services/database_service.dart';
import 'package:rider/ui/snackbars/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  LoginBody loginObj = LoginBody();
  bool isLoginPressed = false;
  late BuildContext context;
  final _dialogService = locator<DialogService>();
  final _dbService = locator<DatabaseService>();
  final log = getLogger("LoginViewModel");
  bool passwordHidden = true;

  void onLoginPressed() {
    isLoginPressed = true;
    rebuildUi();
  }

  LoginViewModel(this.context);

  navigateToSignUp() {
    _navigationService.navigateToSignupView();
  }

  navigateToForgot() {
    _navigationService.navigateToForgotPasswordView();
  }

  togglePassVisibility() {
    passwordHidden = !passwordHidden;
    rebuildUi();
  }

  chooseRoute() {
    if (_authService.userProfile?.verified == 0) {
      _navigationService.navigateToEmailVerificationView(
          email: _authService.userProfile?.email ?? "");
      generateOTP();
    } else {
      ///documents vehicles
      // if (_authService.userProfile?.isDocumentsVerified == 0) {
      //   _navigationService.replaceWithApprovalView();
      // } else
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
        _navigationService.clearStackAndShow(Routes.homeView);
      }
    }
  }

  ///login (email and password)
  loginWithEmailAndPassword() async {
    print(loginObj.toJson());
    setBusy(true);
    try {
      AuthResponse response =
          await _authService.loginWithEmailAndPassword(loginObj);
      if (response.success) {
        chooseRoute();
        showSnackBar(context,
            message:
                "Welcome Back! ${response.authResponseModel?.user?.name ?? ""}");
      } else {
        showDialog(response);
      }
    } catch (e) {
      log.e(e);
    }
    setBusy(false);
  }

  generateOTP() async {
    final response = await _dbService.generateOTP(loginObj.email ?? "");
    if (response['success']) {
      showSnackBar(context, message: "Otp Sent Successfully");
      // Handle this case..
    } else {
      // Handle this case..
      // Show error Dialogs.
      _dialogService.showCustomDialog(
        variant: DialogType.error,
        title: 'Error',
        description: response['error'],
      );
    }
  }

  showDialog(AuthResponse response) {
    String error = '';
    if (response.error == "Unauthorised") {
      error = "Email or Password is invalid";
    } else if (response.error is Map<String, dynamic>) {
      error = response.error['email'][0];
    } else {
      error = response.error;
    }
    _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Error',
      description: error,
    );
  }

  double navLat = 37.7749;
  double navLng = -122.4194;
  void launchGoogleMapsNavigation() async {
    var url = "google.navigation";
    if (await canLaunchUrl(Uri.parse("$url:q=$navLat,$navLng&mode=d"))) {
      await launchUrl(Uri.parse("$url:q=$navLat,$navLng&mode=d"));
    } else {
      throw 'Could not launch ${url.toString()}';
    }
  }
}
