import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class MapNavigationOptionSheetModel extends BaseViewModel {
  double navLat = 37.7749;
  double navLng = -122.4194;

  void launchWazNavigation(data) async {
    navLat = data['latitude'];
    navLng = data['longitude'];

    var url = 'https://waze.com/ul';
    var uri = Uri.parse("$url?ll=$navLat,$navLng&navigate=yes");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }

  void launchAppleMapsNavigation(data) async {
    var url = "http://maps.apple.com";
    navLat = data['latitude'];
    navLng = data['longitude'];

    if (await canLaunchUrl(Uri.parse("$url/?sll=$navLat,$navLng"))) {
      await launchUrl(Uri.parse("$url/?sll=$navLat,$navLng"));
    } else {
      throw 'Could not launch ${url.toString()}';
    }
  }

  void launchGoogleMapsNavigation(data) async {
    var url = "google.navigation";
    navLat = data['latitude'];
    navLng = data['longitude'];
    if (await canLaunchUrl(Uri.parse("$url:q=$navLat,$navLng&mode=d"))) {
      await launchUrl(Uri.parse("$url:q=$navLat,$navLng&mode=d"));
    } else {
      throw 'Could not launch ${url.toString()}';
    }
  }
}
