// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:async';
import 'package:rider/app/app.locator.dart';
import 'package:rider/app/app.logger.dart';
import 'package:rider/app/app.router.dart';
import 'package:rider/responses/order_response.dart';
import 'package:rider/services/database_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MyOrdersViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dbService = locator<DatabaseService>();
  final log = getLogger("MyOrdersViewModel");

  MyOrdersViewModel() {
    getMyOrders();
  }

  navigateToDetail(OrderModel order) {
    _navigationService.navigateToSpecificOrderView(order: order);
  }

  OrderResponse? response;
  List<OrderModel> ordersList = [];

  Future<void> getMyOrders() async {
    setBusy(true);
    final res = await _dbService.fetchMyOrders();

    if (res.success) {
      //
      ordersList = res.body ?? [];
      if (ordersList.isNotEmpty) {
        ordersList.sort((a, b) => b.id!.compareTo(a.id!));
      }
      // checkForCancelOption();
    } else {
      //
    }
    setBusy(false);
    rebuildUi();
  }

  // void checkForCancelOption() {
  //   ///
  //   ordersList.forEach((element) {
  //     bool diffLessThanTwoMinute = getTimeComparison(element);
  //     if (diffLessThanTwoMinute) {
  //       element.canCancel = true;
  //       rebuildUi();
  //       Timer.periodic(const Duration(seconds: 1), (timer) {
  //         if (element.canCancel == true) {
  //           bool diffLessThanTwoMinute = getTimeComparison(element);
  //           if (!diffLessThanTwoMinute) {
  //             element.canCancel = false;
  //             timer.cancel();
  //             rebuildUi();
  //           }
  //         }
  //       });
  //     }
  //   });
  // }

  // bool getTimeComparison(OrderModel order) {
  //   // String? localTime = DateTimeHelper()
  //   //     .convertTimeToLocal(DateTime.parse(order.createdAt ?? ""));
  //   // log.wtf("local time======> $localTime");
  //   bool diffLessThanTwoMinute = DateTimeHelper()
  //       .differenceLessThanTwoMinutes(DateTime.parse(order.createdAt ?? ""));
  //   return diffLessThanTwoMinute;
  // }
}
