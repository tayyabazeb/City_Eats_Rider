import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/app/app.locator.dart';
import 'package:rider/constants/asesets.dart';
import 'package:rider/responses/order_response.dart';
import 'package:rider/services/auth_service.dart';
import 'package:rider/ui/common/app_colors.dart';
import 'package:rider/ui/common/ui_helpers.dart';
import 'package:rider/ui/dialogs/progress_indicator/progress.dart';
import 'package:rider/ui/views/my_orders/my_orders_view.dart';
import 'package:rider/ui/widgets/common/cache_network_image.dart';
import 'package:stacked/stacked.dart';
import 'earning_viewmodel.dart';

class EarningView extends StackedView<EarningViewModel> {
  const EarningView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, EarningViewModel viewModel, Widget? child) {
    return CustomProgressIndicator(
      isLoading: viewModel.isBusy,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
            title: Text(
          "Earnings",
          style: Theme.of(context).textTheme.bodyMedium,
        )),
        body: RefreshIndicator(
          color: kcPrimaryColor,
          onRefresh: () async {
            viewModel.getEarnings();
            // return true;
          },
          child: Container(
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: ListView(children: [
              ///
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      viewModel.toggleType(EarningType.pending);
                    },
                    child: Container(
                      // height: 50.h,
                      // width: 100.w,
                      decoration: BoxDecoration(
                        color: viewModel.selectedType == EarningType.pending
                            ? kcPrimaryColor
                            : kcWhiteColor,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: kcDarkGreyColor),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                      child: Center(
                        child: Text(
                          "Pending",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: viewModel.selectedType ==
                                          EarningType.pending
                                      ? kcWhitColor
                                      : kcBlackColor.withOpacity(.6),
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  20.horizontalSpace,
                  InkWell(
                    onTap: () {
                      viewModel.toggleType(EarningType.cleared);
                    },
                    child: Container(
                      // height: 50.h,
                      // width: 100.w,
                      decoration: BoxDecoration(
                        color: viewModel.selectedType == EarningType.cleared
                            ? kcPrimaryColor
                            : kcWhiteColor,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: kcDarkGreyColor),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                      child: Center(
                        child: Text(
                          "Cleared",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: viewModel.selectedType ==
                                          EarningType.cleared
                                      ? kcWhitColor
                                      : kcBlackColor.withOpacity(.6),
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),

              ///
              30.verticalSpace,
              Container(
                width: screenWidth(context),
                // height: 300.h,
                decoration: BoxDecoration(
                  color: kcPrimaryColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Your account from pending orders",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: kcWhitColor,
                              fontSize: 12.sp,
                            ),
                      ),
                    ),
                    20.verticalSpace,
                    Text(
                      "Hello",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: kcWhitColor,
                          ),
                    ),
                    Text(
                      "${locator<AuthService>().userProfile?.name?.toUpperCase()}",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: kcWhitColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    10.verticalSpace,
                    // const Icon(Icons.wallet, size: 70),
                    Image.asset(
                      "$kcStaticImagesPath/wallet_icon.png",
                      height: 50.h,
                      width: 50.w,
                    ),
                    10.verticalSpace,
                    Text(
                      // "£ 329.5",
                      "£ ${viewModel.getTotalAmount()}",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: kcWhitColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),

              ///
              30.verticalSpace,
              ListView.separated(
                itemCount: viewModel.getCurrentList().length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  List<OrderModel> list = viewModel.getCurrentList();
                  String? localTimeDate = DateTimeHelper().convertTimeToLocal(
                      DateTime.parse(list[index].createdAt ?? ""));
                  return Container(
                    width: screenWidth(context),
                    // height: 80.h,
                    decoration: BoxDecoration(
                        color: kcWhiteColor,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: kcGreyColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(0, 3),
                            // changes position of shadow
                          ),
                        ]),
                    padding:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            localTimeDate.toString(),
                            // "30-jan-2024 | 02:19 PM",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 10.sp,
                                      color: kcDarkGreyColor.withOpacity(.7),
                                    ),
                          ),
                          ListTile(
                            onTap: () {
                              viewModel
                                  .navigateToSpecificOrderView(list[index]);
                            },
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                                padding: EdgeInsets.all(10.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.r),
                                    border: Border.all(color: kcGreyColor)),
                                child: NetworkImageWidget(
                                    height: 35.w,
                                    width: 35.w,
                                    url: list[index].restaurant?.featureImage ??
                                        "")),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  // "Order ID: 215",
                                  "Order ID: ${list[index].id}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontSize: 12.sp),
                                ),
                                RichText(
                                    text: TextSpan(
                                        text: "Order item(s): ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              fontSize: 10.sp,
                                            ),
                                        children: [
                                      TextSpan(
                                        text:
                                            "${list[index].orderDetail?.first.food?.name}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                fontSize: 10.sp,
                                                color: kcDarkGreyColor
                                                    .withOpacity(.9)),
                                      )
                                    ])),
                                // Row(
                                //   children: [
                                //     Text(
                                //       "Order item(s):",
                                //       style: Theme.of(context)
                                //           .textTheme
                                //           .bodyMedium
                                //           ?.copyWith(
                                //             fontSize: 10.sp,
                                //           ),
                                //     ),
                                //     Text(
                                //       // "Crown Crust",
                                //       "${list[index].orderDetail?.first.food?.name}",
                                //       style: Theme.of(context)
                                //           .textTheme
                                //           .bodyMedium
                                //           ?.copyWith(
                                //               fontSize: 10.sp,
                                //               color: kcDarkGreyColor
                                //                   .withOpacity(.9)),
                                //     ),
                                //   ],
                                // ),
                                3.verticalSpace,
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  "Delivery Changes: ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontSize: 10.sp),
                                ),
                                Text(
                                  // "£ 27.00",
                                  "£ ${list[index].riderCharges ?? 0}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontSize: 10.sp,
                                          color:
                                              kcDarkGreyColor.withOpacity(.9)),
                                ),
                              ],
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.orangeAccent[400],
                              size: 16,
                            ),
                          ),
                        ]),
                  );
                },
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => 12.verticalSpace,
              ),
              20.verticalSpace,
            ]),
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(EarningViewModel viewModel) {
    viewModel.getEarnings();
    super.onViewModelReady(viewModel);
  }

  @override
  EarningViewModel viewModelBuilder(BuildContext context) => EarningViewModel();
}
