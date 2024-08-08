// ignore_for_file: use_build_context_synchronously
import 'package:rider/responses/order_response.dart';
import 'package:rider/ui/common/app_colors.dart';
import 'package:rider/ui/common/ui_helpers.dart';
import 'package:rider/ui/dialogs/progress_indicator/progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';
import 'my_orders_viewmodel.dart';

class MyOrdersView extends StackedView<MyOrdersViewModel> {
  const MyOrdersView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, MyOrdersViewModel viewModel, Widget? child) {
    return CustomProgressIndicator(
      isLoading: viewModel.isBusy,
      child: Scaffold(
        appBar: AppBar(
          shadowColor: kcWhiteColor,
          title: Text(
            "My Orders",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        backgroundColor: kcLightGreyColor,
        body: RefreshIndicator(
          color: kcPrimaryColor,
          onRefresh: () async {
            await viewModel.getMyOrders();
          },
          child: Container(
            padding: EdgeInsets.only(
                left: 20.w, right: 20.w, top: 20.h, bottom: 20.h),
            child: ListView.separated(
              shrinkWrap: true,
              // physics: const BouncingScrollPhysics(),
              itemCount: viewModel.ordersList.length,
              itemBuilder: (context, index) =>
                  _item(context, viewModel, viewModel.ordersList[index]),
              separatorBuilder: (BuildContext context, int index) {
                return 15.verticalSpace;
              },
            ),

            // Column(children: [
            //   _item(context, viewModel),
            //   15.verticalSpace,
            //   // _item(context, viewModel),
            //   // 15.verticalSpace,
            //   // _item(context, viewModel),
            //   // 15.verticalSpace,
            //   // _item(context, viewModel),
            // ]),
          ),
        ),
      ),
    );
  }

  _item(BuildContext context, MyOrdersViewModel viewModel, OrderModel order) {
    String? localTime = DateTimeHelper()
        .convertTimeToLocal(DateTime.parse(order.createdAt ?? ""));
    return InkWell(
      onTap: () {
        viewModel.navigateToDetail(order);
      },
      child: Container(
        width: screenWidth(context),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: kcWhitColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              const Icon(Icons.add_business),
              12.horizontalSpace,
              Text(
                // "Restaurant Name",
                order.restaurant?.name ?? "",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16.sp,
                    ),
              ),
            ],
          ),
          12.verticalSpace,
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // "Order ID: 12345678",
                    "Order ID: ${order.id}",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 12.sp,
                        ),
                  ),
                  6.verticalSpace,
                  Text(
                    // "07-04-2022, 12:30 pm",
                    // formattedDateTime,
                    (localTime).toString(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 12.sp, color: kcBlackColor.withOpacity(0.7)),
                  ),
                ],
              ),
            ],
          ),
          12.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Status",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14.sp, color: kcBlackColor.withOpacity(0.7)),
              ),
              Text(
                // "In Progress",
                order.orderStatus == 'cancel_request'
                    ? "cancel request"
                    : "${order.orderStatus}",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 12.sp,
                      color: order.orderStatus == "pending"
                          ? kcPrimaryColor
                          : order.orderStatus == "completed"
                              ? kGreenColor
                              : Colors.red,
                    ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  @override
  MyOrdersViewModel viewModelBuilder(BuildContext context) =>
      MyOrdersViewModel();
}

class DateTimeHelper {
  // Create a DateTime object
  // DateTime utcDateTime = DateTime.utc(2023, 1, 1, 12, 0, 0);

  convertTimeToLocal(DateTime utcDateTime) {
    // Convert the DateTime to the local time zone
    DateTime localDateTime = utcToLocal(utcDateTime);

    // Format the local DateTime
    String formattedTime = formatLocalDateTime(localDateTime);

    // print('UTC DateTime: $utcDateTime');
    // print('Local DateTime: $formattedTime');
    return formattedTime;
  }

  DateTime utcToLocal(DateTime utcDateTime) {
    // Create a TZDateTime object using the UTC DateTime and the local time zone
    final local = utcDateTime.toLocal();
    return DateTime(local.year, local.month, local.day, local.hour,
        local.minute, local.second, local.millisecond, local.microsecond);
  }

  String formatLocalDateTime(DateTime localDateTime) {
    // Format the DateTime using the desired pattern
    final formatter = DateFormat('MM-dd-yyyy, hh:mm a');
    return formatter.format(localDateTime);
  }

  differenceLessThanTwoMinutes(DateTime utcDateTime1) {
    // Create two DateTime objects

    // Convert UTC DateTime to local DateTime
    DateTime localDateTime1 = utcToLocal(utcDateTime1);
    DateTime localDateTime2 = DateTime.now();

    // Find the difference between the two DateTime objects
    Duration difference = localDateTime2.difference(localDateTime1);

    // Check if the difference is less than two minutes
    if (difference.inMinutes < 2) {
      // Perform the action (replace this with your actual action)
      // print('The difference is less than two minutes.');
      return true;
    } else {
      // print('The difference is equal to or greater than two minutes.');
      return false;
    }
  }
}
