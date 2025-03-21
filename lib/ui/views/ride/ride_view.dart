import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rider/responses/order_response.dart';
import 'package:rider/ui/buttons/custom_elevated_button.dart';
import 'package:rider/ui/common/app_colors.dart';
import 'package:rider/ui/common/ui_helpers.dart';
import 'package:rider/ui/dialogs/progress_indicator/progress.dart';
import 'package:rider/ui/widgets/common/cache_network_image.dart';
import 'package:stacked/stacked.dart';
import 'ride_viewmodel.dart';

class RideView extends StackedView<RideViewModel> {
  const RideView({Key? key, this.order}) : super(key: key);
  final OrderModel? order;

  @override
  Widget builder(BuildContext context, RideViewModel viewModel, Widget? child) {
    return CustomProgressIndicator(
      isLoading: viewModel.isBusy,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            ///map section
            Container(
              height: screenHeight(context) / 2.4,
              color: kcGreyColor,
              child: GoogleMap(
                mapType: MapType.normal,
                markers: viewModel.markerList.toSet(),
                polylines: viewModel.polyLineList.toSet(),
                initialCameraPosition: const CameraPosition(
                    target: LatLng(20.42796133580664, 80.885749655962),
                    zoom: 8),
                onMapCreated: (GoogleMapController controller) {
                  viewModel.onMapCreated(controller);
                },
              ),
            ),

            ///
            Expanded(
              child: Container(
                // height: screenHeight(context) / 1.3,
                // height: 515.h,
                width: screenWidth(context),
                color: kcPrimaryColor,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      15.verticalSpace,
                      Text(
                        viewModel.statusText,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 20.sp, color: kcWhitColor),
                      ),
                  
                      ///
                      15.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Distance",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontSize: 14.sp,
                                        color: const Color(0xff444444)),
                              ),
                              5.verticalSpace,
                              Text(
                                // "25 mins",
                                "${viewModel.findDistanceLocally().toStringAsFixed(2)} kms",
                                // "${viewModel.duration.inMinutes.toInt()} mins",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontSize: 16.sp, color: kcWhitColor),
                              ),
                            ],
                          ),
                          CustomElevatedButton(
                            size: Size(130.w, 40.h),
                            text: "Directions",
                            onPressed: viewModel.rideStatus == RideStatus.pending
                                ? null
                                : () {
                                    viewModel.showMapBottomSheet();
                                  },
                            backgroundColor: const Color(0xff444444),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.send,
                                  color: kcWhitColor,
                                  size: 12,
                                ),
                                10.horizontalSpace,
                                Text(
                                  "Directions",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: kcWhitColor, fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ),
                          // 12.horizontalSpace,
                        ],
                      ),
                      15.verticalSpace,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              viewModel.rideStatus == RideStatus.onWay
                                  ? "Pickup from"
                                  : "Drop off",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontSize: 14.sp,
                                      color: const Color(0xff444444)),
                            ),
                            8.verticalSpace,
                            Text(
                              // "Street 123, G1 Johar Town Lahore City, Punjab",
                              viewModel.rideStatus == RideStatus.onWay
                                  // "${order.deliveryAddressObj?.address ?? ""}, ${order.deliveryAddressObj?.city ?? ""}, ${order.deliveryAddressObj?.zipCode ?? ""}",
                                  ? viewModel.order?.restaurant?.address ?? ""
                                  : "${viewModel.order?.deliveryAddressObj?.address ?? ""}, ${viewModel.order?.deliveryAddressObj?.zipCode ?? ""}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontSize: 16.sp, color: kcWhitColor),
                            ),
                          ],
                        ),
                      ),
                      20.verticalSpace,
                      Row(
                        children: [
                          CircleAvatar(
                              radius: 20.r,
                              backgroundColor: const Color(0xff444444),
                              foregroundColor: const Color(0xff444444),
                              child: NetworkImageWidget(
                                // url: "",
                                url: viewModel.rideStatus == RideStatus.onWay ||
                                        viewModel.rideStatus == RideStatus.pending
                                    ? viewModel.order?.restaurant?.featureImage ??
                                        ""
                                    : viewModel.order?.user?.image ?? "",
                                isProfilePic: true,
                              )),
                          20.horizontalSpace,
                          Text(
                            // "Sender Name",
                            viewModel.rideStatus == RideStatus.onWay ||
                                    viewModel.rideStatus == RideStatus.pending
                                ? viewModel.order?.restaurant?.name ?? ""
                                : viewModel.order?.user?.name ?? "",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: 16.sp, color: const Color(0xff444444)),
                          ),
                        ],
                      ),
                      20.verticalSpace,
                      Row(
                        children: [
                          Expanded(
                            child: CustomElevatedButton(
                              side: const BorderSide(color: Color(0xff444444)),
                              borderRadius: BorderRadius.circular(10.r),
                              text: "Message",
                              onPressed: () {
                                viewModel.openMessagingApp();
                              },
                              size: const Size(150, 40),
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.chat_bubble,
                                        color: Color(0xff444444)),
                                    10.horizontalSpace,
                                    Text("Message",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: const Color(0xff444444)))
                                  ],
                                ),
                              ),
                            ),
                          ),
                  
                          //
                          10.horizontalSpace,
                  
                          //
                          Expanded(
                            child: CustomElevatedButton(
                              side: const BorderSide(color: Color(0xff444444)),
                              borderRadius: BorderRadius.circular(10.r),
                              text: viewModel.callButtonText,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: const Color(0xff444444)),
                              onPressed: () {
                                ///
                                viewModel.onCallApp();
                              },
                              // size: const Size(150, 40),
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.call,
                                        color: Color(0xff444444)),
                                    3.horizontalSpace,
                                    Text(
                                        viewModel.rideStatus == RideStatus.onWay
                                            ? viewModel.callButtonText
                                            : "Call Customer",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: const Color(0xff444444)))
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                  
                      //
                      16.verticalSpace,
                  
                      ///text if rider is reach to
                      if (viewModel.rideStatus == RideStatus.onWay ||
                          viewModel.rideStatus == RideStatus.arrivedAtPickup)
                        Text(
                            viewModel.rideStatus == RideStatus.onWay
                                ? "When you arrive at the restaurant’s location then click the below button"
                                : viewModel.rideStatus == RideStatus.arrivedAtPickup
                                    ? "When you arrive at the customer’s location then click the below button"
                                    : "",
                            style: Theme.of(context).textTheme.bodyMedium),
                  
                      8.verticalSpace,
                  
                      ///
                      CustomElevatedButton(
                        text: viewModel.rideStatus == RideStatus.pending
                            ? "Accept order"
                            : viewModel.buttonText,
                        onPressed: () {
                          viewModel.rideStatus == RideStatus.pending
                              ? viewModel.acceptRide(viewModel.order?.id ?? 0)
                              : viewModel.rideStatus == RideStatus.onWay
                                  ? viewModel.arriveAtPickUp()
                                  : viewModel.arriveAtDropOff();
                        },
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: kcPrimaryColor, fontSize: 18.sp),
                        backgroundColor: kcWhitColor,
                      ),
                  
                      10.verticalSpace,
                  
                      ///
                      if (viewModel.rideStatus == RideStatus.onWay)
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              visualDensity: const VisualDensity(vertical: -4),
                            ),
                            onPressed: () {
                              //
                              viewModel.navigateToDetail();
                            },
                            child: Text(
                              "View Details",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color: const Color(0xff444444),
                                      decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                     100.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onViewModelReady(RideViewModel viewModel) {
    // viewModel.rideStatus = RideStatus.pending;
    super.onViewModelReady(viewModel);
  }

  @override
  RideViewModel viewModelBuilder(BuildContext context) => RideViewModel(order);
}
