import 'package:rider/app/app.locator.dart';
import 'package:rider/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class JobAcceptViewModel extends BaseViewModel {
  final navService = locator<NavigationService>();

  navigateToRideView() {
    navService.navigateToRideView();
  }
}
