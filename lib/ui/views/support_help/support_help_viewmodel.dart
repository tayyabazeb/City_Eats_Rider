import 'package:rider/app/app.locator.dart';
import 'package:rider/services/database_service.dart';
import 'package:rider/ui/snackbars/custom_snackbar.dart';
import 'package:rider/ui/views/support_help/support_help_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SupportHelpViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _dbService = locator<DatabaseService>();
  bool isButtonPressed = false;

  back() {
    _navigationService.back();
  }

  requestFeedback(context) async {
    setBusy(true);
    final res = await _dbService.dispute(
        emailValue.toString(), objectValue.toString(), messageValue.toString());
    if (res['success']) {
      showSnackBar(context, message: res['body']);
      clearForm();
      _navigationService.back();
    } else {}
    setBusy(false);
  }
}
