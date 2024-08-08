import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/constants/asesets.dart';
import 'package:rider/responses/order_response.dart';
import 'package:rider/ui/buttons/custom_elevated_button.dart';
import 'package:rider/ui/common/app_colors.dart';
import 'package:rider/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'on_way_viewmodel.dart';

class OnWayView extends StackedView<OnWayViewModel> {
  const OnWayView({Key? key, required this.order}) : super(key: key);
  final OrderModel? order;

  @override
  Widget builder(
      BuildContext context, OnWayViewModel viewModel, Widget? child) {
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
            "On the way",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold),
          )),
      body: Container(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
        child: Column(children: [
          Image.asset(
            "$kcStaticImagesPath/onWay.png",
          ),
          80.verticalSpace,
          Container(
            width: screenWidth(context),
            // height: 210.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: const Color(0xffF8F8F8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery Details",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 14.sp),
                    ),
                    InkWell(
                      onTap: () {
                        viewModel.navigateToMap();
                      },
                      child: CircleAvatar(
                        backgroundColor: kcPrimaryColor,
                        radius: 20.r,
                        child: const Icon(
                          Icons.location_on,
                          color: kcWhitColor,
                        ),
                      ),
                    )
                  ],
                ),
                8.verticalSpace,
                Text(
                  // "Street 123, G1 Johar Town Lahore City, Punjab",
                  order?.restaurant?.address ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 14.sp),
                ),
                10.verticalSpace,
                Text(
                  // "Aqib munir",
                  order?.restaurant?.name ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 14.sp),
                ),
                8.verticalSpace,
                Text(
                  // "0308-4920851",
                  order?.restaurant?.phone ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 14.sp),
                ),
                12.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        side: const BorderSide(color: kcPrimaryColor),
                        backgroundColor: kcWhitColor,
                        borderRadius: BorderRadius.circular(10.r),
                        text: "Message",
                        onPressed: () {
                          viewModel.openMessagingApp();
                        },
                        size: const Size(150, 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.chat_bubble,
                                color: kcPrimaryColor),
                            10.horizontalSpace,
                            Text("Message",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: kcPrimaryColor))
                          ],
                        ),
                      ),
                    ),

                    //
                    10.horizontalSpace,

                    //
                    Expanded(
                      child: CustomElevatedButton(
                        side: const BorderSide(color: kcPrimaryColor),
                        backgroundColor: kcWhitColor,
                        borderRadius: BorderRadius.circular(10.r),
                        text: "Call",
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: kcPrimaryColor),
                        onPressed: () {
                          ///
                          viewModel.onCallApp();
                        },
                        size: const Size(150, 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.call, color: kcPrimaryColor),
                            10.horizontalSpace,
                            Text("Call",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: kcPrimaryColor))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          60.verticalSpace,
          CustomElevatedButton(
            text: "Go back",
            onPressed: () {
              viewModel.back();
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
                  "Go back",
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
    );
  }

  @override
  OnWayViewModel viewModelBuilder(BuildContext context) =>
      OnWayViewModel(order);
}
