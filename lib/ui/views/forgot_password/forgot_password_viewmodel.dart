// ignore_for_file: use_build_context_synchronously

import 'package:rider/app/app.dialogs.dart';
import 'package:rider/app/app.locator.dart';
import 'package:rider/app/app.router.dart';
import 'package:rider/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:rider/ui/snackbars/custom_snackbar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  String email = '';
  bool isForgotPressed = false;

  final _dbService = locator<DatabaseService>();

  bool isLoginPressed = false;
  late BuildContext context;
  final _dialogService = locator<DialogService>();

  onForgotPressed() {
    isForgotPressed = true;
    rebuildUi();
  }

  ForgotPasswordViewModel(this.context);

  _navigateToNewPassword() {
    _navigationService.navigateToNewPasswordView(email: email);
  }

  back() {
    _navigationService.back();
  }

  ///login (email and password)
  Future<void> requestForgotPassword() async {
    setBusy(true);
    final response = await _dbService.forgotPassword(email);

    if (response.success) {
      showSnackBar(context,
          message:
              "We have sent you an OTP on your registered email which is expected to be received in 2 minutes. Please check both inbox and spams.");
      _navigateToNewPassword();
    } else {
      showDialog(response.error ?? "");
    }
    setBusy(false);
  }

  showDialog(error) {
    _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Error',
      description: error,
    );
  }
}
