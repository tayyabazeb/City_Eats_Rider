import 'package:rider/app/app.locator.dart';
import 'package:rider/app/app.router.dart';
import 'package:rider/responses/order_response.dart';
import 'package:rider/responses/ratings_response.dart';
import 'package:rider/services/database_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RatingsViewModel extends BaseViewModel {
  final _dbService = locator<DatabaseService>();
  final _navService = locator<NavigationService>();

  List<OrderModel> ratingList = [];

  Future<void> getRatings() async {
    setBusy(true);
    RatingsResponse res = await _dbService.getRatings();
    if (res.success) {
      ratingList = res.body ?? [];
      // Sort myList in descending order based on the id property
      ratingList.sort((a, b) => b.id!.compareTo(a.id!));
      getAverageRatings();
    }
    setBusy(false);
  }

  navigateToSpecificOrderView(OrderModel order) {
    _navService.navigateToSpecificOrderView(order: order);
  }

  var averageRatings = 0;
  int count = 0;

  void getAverageRatings() {
    count = 0;
    for (var element in ratingList) {
     
      //
      if ((element.riderReview?.reviewStar ?? 0) != 0) {
        count++;
        averageRatings += element.riderReview?.reviewStar ?? 0;
      }
    }
    rebuildUi();
  }

  int getAvgRating() {
    return (int.parse(averageRatings.toString()) ~/ (ratingList.length));
  }
}
