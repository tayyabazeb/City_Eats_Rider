import 'package:rider/app/app.dialogs.dart';
import 'package:rider/app/app.locator.dart';
import 'package:rider/app/app.router.dart';
import 'package:rider/services/auth_service.dart';
import 'package:rider/services/database_service.dart';
import 'package:rider/ui/snackbars/custom_snackbar.dart';
import 'package:rider/ui/views/change_password/change_password_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChangePasswordViewModel extends FormViewModel {
  final _dbService = locator<DatabaseService>();
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  bool isButtonPressed = false;
  bool oldPasswordHidden = true;
  bool newPasswordHidden = true;
  bool cPasswordHidden = true;

  toggleOldPassVisibility() {
    oldPasswordHidden = !oldPasswordHidden;
    rebuildUi();
  }

  toggleNewPassVisibility() {
    newPasswordHidden = !newPasswordHidden;
    rebuildUi();
  }

  toggleCPassVisibility() {
    cPasswordHidden = !cPasswordHidden;
    rebuildUi();
  }

  Future<void> requestPasswordChange(context) async {
    setBusy(true);
    final res = await _dbService.changeMyPassword(
        passwordValue ?? "", newPasswordValue ?? "");
    if (res['success'] ?? false) {
      // _routeToLogin();
      _navigationService.back();
      showSnackBar(context, message: res['body']);
    } else {
      ///
      locator<DialogService>().showCustomDialog(
        variant: DialogType.error,
        title: "Error",
        description: res['error'] ?? "error",
      );
    }

    setBusy(false);
  }

  _routeToLogin() {
    _authService.logout();
    _navigationService.clearStackAndShow(Routes.loginView);
  }
}
