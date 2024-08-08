import 'package:rider/app/app.locator.dart';
import 'package:rider/app/app.router.dart';
import 'package:rider/responses/earnings_response.dart';
import 'package:rider/responses/order_response.dart';
import 'package:rider/services/database_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EarningViewModel extends BaseViewModel {
  EarningType selectedType = EarningType.pending;
  final _dbService = locator<DatabaseService>();
  final _navService = locator<NavigationService>();

  void toggleType(EarningType type) {
    selectedType = type;
    rebuildUi();
  }

  List<OrderModel> pendingList = [];
  List<OrderModel> clearedList = [];

  List<OrderModel> getCurrentList() {
    return selectedType == EarningType.pending ? pendingList : clearedList;
  }

  double pendingListAmount = 0;
  double clearedListAmount = 0;

  void calculateDeliveryCharges() {
    for (var element in pendingList) {
      pendingListAmount += double.parse((element.riderCharges ?? 0).toString());
    }

    for (var element in clearedList) {
      clearedListAmount += double.parse((element.riderCharges ?? 0).toString());
    }

    rebuildUi();
  }

  double getTotalAmount() {
    return selectedType == EarningType.pending
        ? pendingListAmount
        : clearedListAmount;
  }

  Future<void> getEarnings() async {
    setBusy(true);
    EarningsResponse res = await _dbService.getEarnings();
    if (res.success) {
      pendingList = res.body?.pendingAmounts ?? [];
      clearedList = res.body?.clearedAmounts ?? [];
      calculateDeliveryCharges();
      // Sort myList in descending order based on the id property
      pendingList.sort((a, b) => b.id!.compareTo(a.id!));
      clearedList.sort((a, b) => b.id!.compareTo(a.id!));
    }
    setBusy(false);
  }

  navigateToSpecificOrderView(OrderModel order) {
    _navService.navigateToSpecificOrderView(order: order);
  }
}

enum EarningType {
  pending,
  cleared,
}
