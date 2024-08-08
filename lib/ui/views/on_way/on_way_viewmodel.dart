import 'package:rider/app/app.locator.dart';
import 'package:rider/responses/order_response.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

class OnWayViewModel extends BaseViewModel {
  OrderModel? currentOrder;
  final navService = locator<NavigationService>();

  OnWayViewModel(this.currentOrder);

  back() {
    navService.back();
  }

  void openMessagingApp() async {
    String uri =
        'sms:${currentOrder?.restaurant?.phone ?? ""}'; // Scheme for opening SMS app
    if (await canLaunchUrl(Uri.parse(uri))) {
      await launchUrl(Uri.parse(uri));
    } else {
      print('Could not launch $uri');
    }
  }

  void onCallApp() async {
    String uri =
        'tel:${currentOrder?.restaurant?.phone ?? ""}'; // Scheme for opening SMS app
    if (await canLaunchUrl(Uri.parse(uri))) {
      await launchUrl(Uri.parse(uri));
    } else {
      print('Could not launch $uri');
    }
  }

  void navigateToMap() async {
    // double lat = 37.7749;
    double lat =
        double.parse(currentOrder?.restaurant?.latitude.toString() ?? "0.0");
    // double lng = -122.4194;
    double lng =
        double.parse(currentOrder?.restaurant?.longitude.toString() ?? "0.0");
    var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }
}
