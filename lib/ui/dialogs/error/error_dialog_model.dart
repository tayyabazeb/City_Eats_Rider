import 'package:rider/app/app.locator.dart';
import 'package:rider/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ErrorDialogModel extends BaseViewModel {
  final _navService = locator<NavigationService>();

  navigateToStartup() {
    _navService.clearTillFirstAndShowView(const StartupView());
  }
}
