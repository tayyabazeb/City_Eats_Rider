import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/responses/order_response.dart';
import 'package:rider/ui/buttons/custom_elevated_button.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../widgets/common/custom_text_field/custom_text_field.dart';
import 'order_detail_viewmodel.dart';

class OrderDetailView extends StackedView<OrderDetailViewModel> {
  const OrderDetailView({Key? key, required this.order}) : super(key: key);
  final OrderModel? order;

  @override
  Widget builder(
      BuildContext context, OrderDetailViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              viewModel.back();
            },
          ),
          title: Text(
            "Order Detail",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold),
          )),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 20.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Store information",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold, color: kcBlackColor),
            ),
            16.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Restaurant Name",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: kcBlackColor.withOpacity(.5), fontSize: 12.sp),
                    ),
                    10.verticalSpace,
                    Text(
                      "Address",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: kcBlackColor.withOpacity(.5), fontSize: 12.sp),
                    ),
                  ],
                ),
                30.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // "Kashif Ali",
                        order?.restaurant?.name ?? "",
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 14.sp,
                              color: const Color(0xff0C0C0C),
                            ),
                      ),
                      10.verticalSpace,
                      Text(
                        // "House 127 Street abc, Lahore",
                        order?.restaurant?.address ?? "",
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 12.sp,
                              color: const Color(0xff0C0C0C),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            ///
            20.verticalSpace,
            Text(
              "Order Detail",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold, color: kcBlackColor),
            ),
            16.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order ID",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: kcBlackColor.withOpacity(.5), fontSize: 12.sp),
                    ),
                    10.verticalSpace,
                    Text(
                      "Assigned Time",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: kcBlackColor.withOpacity(.5), fontSize: 12.sp),
                    ),
                  ],
                ),
                15.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // "myace-05454502",
                      (order?.id ?? "0").toString(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 14.sp,
                            color: const Color(0xff0C0C0C),
                          ),
                    ),
                    10.verticalSpace,
                    Text(
                      order?.createdAt ?? "",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 14.sp,
                            color: const Color(0xff0C0C0C),
                          ),
                    ),
                  ],
                ),
              ],
            ),
            30.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Items",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 18.sp, color: kcBlackColor),
                ),
                Text(
                  // "2",
                  (order?.orderDetail?.length ?? 0).toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 18.sp, color: kcBlackColor),
                ),
              ],
            ),

            20.verticalSpace,
            Divider(color: kcBlackColor.withOpacity(.5)),
            // 20.verticalSpace,
            ListView.separated(
              itemCount: order?.orderDetail?.length ?? 0,
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: kcPrimaryColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: Text(
                      (index + 1).toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: kcWhitColor, fontSize: 14.sp),
                    ),
                  ),
                ),
                title: Text(
                  // "Red Apple",
                  order?.orderDetail?[index].food?.name ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                trailing: Text(
                  // "\$35.75",
                  "£${order?.orderDetail?[index].price ?? 0}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: const Color(0xff514E4E)),
                ),
              ),
              separatorBuilder: (BuildContext context, int index) {
                return Divider(color: kcBlackColor.withOpacity(.5));
              },
            ),
            Divider(color: kcBlackColor.withOpacity(.5)),
            30.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sp, color: const Color(0xff525252)),
                ),
                Text(
                  // "10 km",
                  order == null
                      ? " km"
                      : "${viewModel.findDistance(order!).toStringAsFixed(2)} km",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16.sp,
                      color: kcBlackColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),

            15.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Estd. Earnings",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sp, color: const Color(0xff525252)),
                ),
                Text(
                  "\$ ${order?.orderAmount ?? 0.0}",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16.sp,
                      color: kcBlackColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            20.verticalSpace,
            Text(
              "Order Note",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 18.sp,
                  color: kcBlackColor,
                  fontWeight: FontWeight.bold),
            ),
            12.verticalSpace,
            CustomTextField(
              enabled: false,
              hintText: "order note",
              maxLines: 4,
              controller: TextEditingController(text: order?.orderNote ?? ""),
            ),
            20.verticalSpace,
            CustomElevatedButton(
              text: "On the way",
              onPressed: () {
                viewModel.navigateToOnWay(order);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.pedal_bike_sharp,
                    color: kcWhitColor,
                    size: 16.sp,
                  ),
                  10.horizontalSpace,
                  Text(
                    "On the way",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: kcWhitColor),
                  )
                ],
              ),
            ),
            20.verticalSpace,
          ]),
        ),
      ),
    );
  }

  @override
  OrderDetailViewModel viewModelBuilder(BuildContext context) =>
      OrderDetailViewModel();
}
