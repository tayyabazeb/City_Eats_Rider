// ignore_for_file: use_build_context_synchronously
import 'dart:async';
import 'package:rider/app/app.dialogs.dart';
import 'package:rider/app/app.locator.dart';
import 'package:rider/app/app.router.dart';
import 'package:rider/responses/auth_response.dart';
import 'package:rider/services/auth_service.dart';
import 'package:rider/services/database_service.dart';
import 'package:rider/ui/snackbars/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EmailVerificationViewModel extends BaseViewModel {
  final _dbService = locator<DatabaseService>();
  final userProfile = locator<AuthService>().userProfile;
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();
  late Timer timer;
  final String email;
  final bool isRoutedFromForgotView;

  String _otp = '';
  int counter = 120;
  late BuildContext context;

  bool get isOtpComplete => _otp.length == 4;
  bool get isCounterZero => counter == 0;

  EmailVerificationViewModel(
    this.context, {
    required this.email,
    required this.isRoutedFromForgotView,
  }) {
    _startTimer();
  }

  routeToLogin() {
    _authService.logout();
    _navigationService.replaceWithLoginView();
  }

  _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      counter--;
      rebuildUi();
      if (counter == 0) {
        timer.cancel();
      }
    });
  }

  onChangeOTP(value) {
    _otp = value;
    rebuildUi();
  }

  verifyOTP() async {
    setBusy(true);
    AuthResponse response = await _dbService.verifyOTP(email, _otp);
    if (response.success) {
      _navigationService.clearStackAndShow(Routes.uploadVehicleDetailsView);
    } else {
      // Show error Dialogs.
      _dialogService.showCustomDialog(
        variant: DialogType.error,
        title: 'Error',
        description: response.error ?? "Invalid otp or Expire otp",
      );
    }
    setBusy(false);
  }

  generateOTP() async {
    setBusy(true);
    final response = await _dbService.generateOTP(email);
    if (response['success'] ?? false) {
      showSnackBar(context,
          message:
              "We have sent you an OTP on your registered email which is expected to be received in 2 minutes. Please check both inbox and spams, otherwise, resend the OTP code");
      _resetTimer();
      // Handle this case..
    } else {
      // Handle this case..
      // Show error Dialogs.
      _dialogService.showCustomDialog(
        variant: DialogType.error,
        title: 'Error',
        description: response['error'] ?? "some error occurred",
      );
    }
    setBusy(false);
  }

  _resetTimer() {
    counter = 120;
    _startTimer();
    rebuildUi();
  }

  @override
  void dispose() {
    if (timer.isActive) {
      timer.cancel();
    }
    super.dispose();
  }
}
