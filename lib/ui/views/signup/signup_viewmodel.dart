import 'package:rider/services/notification_service.dart';
import 'package:rider/app/app.dialogs.dart';
import 'package:stacked/stacked.dart';
import 'package:rider/app/app.locator.dart';
import 'package:rider/app/app.router.dart';
import 'package:rider/responses/auth_response.dart';
import 'package:rider/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../models/auth_models/signup_body.dart';

class SignupViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _notificationService = locator<NotificationService>();
  late BuildContext context;
  SignUpBody signUpBody = SignUpBody();
  final _dialogService = locator<DialogService>();
  bool isSignUpPressed = false;
  bool passwordHidden = true;
  bool cPasswordHidden = true;

  onSignUpPressed() {
    isSignUpPressed = true;
    rebuildUi();
  }

  SignupViewModel(this.context);

  togglePassVisibility() {
    passwordHidden = !passwordHidden;
    rebuildUi();
  }

  toggleCPassVisibility() {
    cPasswordHidden = !cPasswordHidden;
    rebuildUi();
  }

  navigateToLogin() {
    _navigationService.replaceWithLoginView();
  }

  _navigateToEmailVerification() {
    _navigationService.replaceWithEmailVerificationView(
      email: signUpBody.email ?? "",
    );
  }

  Future<void> requestSignUp() async {
    await _notificationService.askPermission();
    setBusy(true);
    AuthResponse response =
        await _authService.signUpWithEmailAndPassword(signUpBody);

    if (response.success) {
      // _navigateToEmailVerification();
      // ignore: use_build_context_synchronously
      await showDialogOnAccountCreation(
          response.authResponseModel?.user?.name ?? "");
      _navigateToEmailVerification();
      // showSnackBar(context,
      //     message:
      //         " ${response.authResponseModel?.user?.name ?? ""} Your Account is Created Successfully!");
    } else {
      // Show dialogs when design is ready.
      showDialog(response);
    }
    setBusy(false);
  }

  showDialog(AuthResponse response) {
    _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Error',
      description: response.error,
    );
  }

  Future<void> showDialogOnAccountCreation(String name) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.accountCreate,
      title: 'Account Created',
      description:
          "Your Account has been created successfully!\nPlease follow all the steps to complete your profile.",
    );
  }
}
