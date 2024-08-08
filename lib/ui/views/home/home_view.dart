import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rider/app/app.router.dart';
import 'package:rider/constants/asesets.dart';
import 'package:rider/ui/common/app_colors.dart';
import 'package:rider/ui/common/ui_helpers.dart';
import 'package:rider/ui/dialogs/progress_indicator/progress.dart';
import 'package:rider/ui/widgets/common/cache_network_image.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return CustomProgressIndicator(
      isLoading: viewModel.isSwitching,
      child: WillPopScope(
        onWillPop: () async {
          // Show a dialog to confirm exit
          bool exitConfirmed = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  'Confirm Exit',
                  // S.of(context).confirmExitText,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                content: Text(
                  'Do you really want to exit the app?',
                  // S.of(context).exitAppText,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                actions: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      surfaceTintColor: Colors.transparent,
                      backgroundColor: kcPrimaryColor,
                    ),
                    child: Text(
                      'Cancel',
                      // S.of(context).cancelText,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 12.sp,
                            color: kcWhiteColor,
                          ),
                    ),
                    onPressed: () {
                      // GoRouter.of(context).pop(false);
                      /// Return false to cancel the pop-up
                      Navigator.of(context).pop(false);
                    },
                  ),
                  TextButton(
                    style: ElevatedButton.styleFrom(
                      surfaceTintColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                    ),
                    child: Text(
                      'Exit',
                      // S.of(context).exitText,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 12.sp,
                            color: kcWhiteColor,
                          ),
                    ),
                    onPressed: () {
                      // GoRouter.of(context).pop(true);
                      /// Return true to confirm exit
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              );
            },
          );

          return exitConfirmed; // If the user dismisses the dialog, default to false
        },
        child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  viewModel.navService.navigateToAccountView();
                },
              ),
              actions: [
                // viewModel.isSwitching
                //     ? const SpinKitFadingCircle(color: kcPrimaryColor, size: 30)
                //     :
                SizedBox(
                  height: 20.h,
                  child: MySwitch(
                    viewModel: viewModel,
                    switchValue: viewModel.userProfile?.userOnline == 1,
                  ),
                ),
                10.horizontalSpace,
                InkWell(
                  onTap: viewModel.notVerified
                      ? () {
                          viewModel.showWaitingDialog();
                        }
                      : () async {
                          viewModel.navigateToProfileSettingsView();
                        },
                  child: Padding(
                    padding: EdgeInsets.only(right: 18.w),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Hero(
                          tag: "profile",
                          child: NetworkImageWidget(
                            url: viewModel.userProfile?.image ?? "",
                            isProfilePic: true,
                            radius: 20.r,
                            height: 30.h,
                            width: 30.w,
                          ),
                        ),
                        if (viewModel.status == 1)
                          Positioned(
                            left: -1,
                            bottom: 0,
                            child: CircleAvatar(
                              backgroundColor: kcPrimaryColor,
                              radius: 5.r,
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            body: RefreshIndicator(
              color: kcPrimaryColor,
              onRefresh: () async {
                print("refresh");
                viewModel.getHomeData();
                Future.delayed(const Duration(seconds: 3), (() => true));
              },
              child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40.h,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      width: screenWidth(context),
                      color:
                          viewModel.status == 1 ? kcPrimaryColor : kcGreyColor,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            viewModel.status == 0
                                ? const Icon(Icons.wifi_off_outlined,
                                    color: kcWhitColor)
                                : const Icon(Icons.wifi, color: kcWhitColor)
                                    .animate(
                                        onPlay: (controller) =>
                                            controller.repeat(
                                              reverse: true,
                                            ))
                                    .fadeOut(
                                        curve: Curves.easeInOut,
                                        delay:
                                            const Duration(milliseconds: 200)),
                            10.horizontalSpace,
                            Text(
                              viewModel.status == 0
                                  ? "You are currently offline"
                                  : "You are online",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: kcWhitColor),
                            )
                          ],
                        ),
                      ),
                    ),
                    20.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Hi, ${viewModel.userProfile?.name ?? ""}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: kcBlackColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.sp),
                          ),
                          12.verticalSpace,
                          Text(
                            "Here is how you are doing!",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          30.verticalSpace,
                          !viewModel.isBusy
                              ? Column(
                                  children: [
                                    Row(
                                      children: [
                                        buildItems(
                                            viewModel,
                                            context,
                                            "Active Orders",
                                            "order.png",
                                            viewModel.activeOrders.toString(),
                                            onTap: () {
                                          if (viewModel.activeOrders > 0) {
                                            viewModel.navigateToRideView();
                                          }
                                        }),
                                        20.horizontalSpace,
                                        buildItems(
                                            viewModel,
                                            context,
                                            "Earnings",
                                            "pound.png",
                                            viewModel.earnings.toString(),
                                            onTap: () {
                                          viewModel.navigateToEarningView();
                                        }),
                                      ],
                                    ),
                                    30.verticalSpace,
                                    Row(
                                      children: [
                                        buildItems(
                                            viewModel,
                                            context,
                                            "History",
                                            "history.png",
                                            viewModel.history.toString(),
                                            onTap: () {
                                          viewModel.navigateToHistoryView();
                                        }),
                                        20.horizontalSpace,
                                        buildItems(
                                            viewModel,
                                            context,
                                            "Ratings",
                                            "star.png",
                                            viewModel.ratings
                                                .toStringAsFixed(1),
                                            isRating: true, onTap: () {
                                          viewModel.navigateToRatingView();
                                        }),
                                      ],
                                    ),
                                  ],
                                )
                              : const Center(
                                  child: SpinKitFadingCircle(
                                      color: kcPrimaryColor, size: 60))
                          // 40.verticalSpace,
                          // CustomElevatedButton(
                          //     borderRadius: BorderRadius.circular(24.r),
                          //     backgroundColor: viewModel.status == 0
                          //         ? kcPrimaryColor
                          //         : Colors.red[500],
                          //     size: Size(224.w, 58.h),
                          //     text: viewModel.status == 0 ? "Online" : "Offline",
                          //     onPressed: () {
                          //       // viewModel.navService.navigateToJobAcceptView();
                          //       viewModel.toggleOnlineOffline();
                          //     })
                        ],
                      ),
                    )
                  ]),
            ),
            floatingActionButton: null
            //  FloatingActionButton(
            //   onPressed: () {},
            // ),
            ),
      ),
    );
  }

  Animate buildItems(HomeViewModel viewModel, BuildContext context,
      String title, String imageUrl, String value,
      {required void Function()? onTap, bool isRating = false}) {
    return Expanded(
      child: InkWell(
        onTap: viewModel.notVerified
            ? () {
                viewModel.showWaitingDialog();
              }
            : onTap,
        child: Container(
          height: 180.h,
          // width: 167.w,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              border: Border.all(color: kcGreyColor),
              color: kcWhitColor,
              borderRadius: BorderRadius.circular(15.r)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                isRating
                    ? SingleRatingIcon(
                        icon: Icons.star,
                        size: 45,
                        iconColor: kcPrimaryColor,
                        rating: double.parse(value))
                    : Image.asset(
                        "$kcStaticImagesPath/$imageUrl",
                        color: kcPrimaryColor,
                        height: 45.h,
                        width: 50.w,
                      ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      // color: kcPrimaryColor,
                      ),
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        // color: kcPrimaryColor,
                      ),
                ),
              ]),
        ),
      ),
    ).animate().fade(duration: 500.ms).scale(delay: 500.ms);
  }

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.askNotificationPermissions();
    viewModel.init();
    super.onViewModelReady(viewModel);
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}

class MySwitch extends StatefulWidget {
  const MySwitch(
      {super.key, required this.viewModel, required this.switchValue});
  final HomeViewModel viewModel;
  final bool switchValue;

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool _switchValue = false;

  @override
  void initState() {
    print("widget.switchValue");
    print(widget.switchValue);
    _switchValue = widget.viewModel.isOnline;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: _switchValue,
      // activeColor: kcPrimaryColor,
      trackColor: MaterialStateProperty.resolveWith<Color?>((states) {
        if (states.contains(MaterialState.selected)) {
          return kcPrimaryColor;
          // Color when the switch is on and selected
        }
        return Colors.transparent;
        // Default color when the switch is on
      }),
      onChanged: (newValue) async {
        if (widget.viewModel.notVerified) {
          widget.viewModel.showWaitingDialog();
        } else {
          await widget.viewModel.toggleStatus(newValue);
          setState(() {
            _switchValue = !_switchValue;
          });
        }
      },
    );
  }
}

class SingleRatingIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color iconColor;
  final double rating;

  const SingleRatingIcon(
      {super.key,
      required this.icon,
      required this.size,
      required this.iconColor,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (Rect rect) {
        return LinearGradient(
          stops: [0, rating / 5, rating / 5],
          colors: [iconColor, iconColor, iconColor.withOpacity(0)],
        ).createShader(rect);
      },
      child: SizedBox(
        width: size,
        height: size,
        child: Icon(icon, size: size, color: Colors.grey[300]),
      ),
    );
  }
}
