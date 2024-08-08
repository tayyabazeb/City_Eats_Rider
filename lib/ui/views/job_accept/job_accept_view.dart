import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/ui/buttons/custom_elevated_button.dart';
import 'package:rider/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'job_accept_viewmodel.dart';

class JobAcceptView extends StackedView<JobAcceptViewModel> {
  const JobAcceptView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, JobAcceptViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          "Waiting",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 50.h),
        child: Center(
          child: Column(children: [
            //
            Text(
              "Job Accepted",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: kcPrimaryColor, fontSize: 24.sp),
            ),
            20.verticalSpace,
            Text(
              "Sender is wating for you to pickup the parcel. Start your ride now.",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: kcBlackColor.withOpacity(.6)),
            ),
            60.verticalSpace,

            ///
            SizedBox(
              height: 120.h,
              width: 120.w,
              child: AnalogClock(
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 2.0, color: Colors.orange.shade900),
                    color: Colors.white,
                    shape: BoxShape.circle),
                width: 120.0,
                isLive: true,
                hourHandColor: Colors.orange.shade900,
                minuteHandColor: Colors.orange.shade900,
                showSecondHand: false,
                numberColor: Colors.black87,
                showNumbers: false,
                showAllNumbers: false,
                textScaleFactor: 1.4,
                showTicks: true,
                showDigitalClock: false,
                datetime: DateTime.now(),
              ),
            ),
            90.verticalSpace,
            CustomElevatedButton(
                text: "Start Ride",
                onPressed: () {
                  viewModel.navigateToRideView();
                }),
          ]),
        ),
      ),
    );
  }

  @override
  JobAcceptViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      JobAcceptViewModel();
}
