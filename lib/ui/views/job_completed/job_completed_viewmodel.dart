import 'package:rider/app/app.locator.dart';
import 'package:rider/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class JobCompletedViewModel extends BaseViewModel {
  final navService = locator<NavigationService>();

  navigateToHome() {
    navService.clearStackAndShow(Routes.homeView);
  }
}
