import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/constants/asesets.dart';
import 'package:rider/ui/buttons/custom_elevated_button.dart';
import 'package:rider/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'job_completed_viewmodel.dart';

class JobCompletedView extends StackedView<JobCompletedViewModel> {
  const JobCompletedView({Key? key, required this.earnings}) : super(key: key);

  final String earnings;

  @override
  Widget builder(
      BuildContext context, JobCompletedViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 50.h),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              "$kcStaticImagesPath/jbcm.png",
              height: 70.h,
              width: 65.w,
            ),
            38.verticalSpace,

            ///
            Text(
              "Ride Completed!",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: kcPrimaryColor, fontSize: 24.sp),
            ),

            20.verticalSpace,

            Text(
              // "You have earned \$85.00 for this ride.",
              "You have earned £$earnings for this ride.",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: kcBlackColor.withOpacity(.6)),
            ),

            24.verticalSpace,
            CustomElevatedButton(
                text: "Go to job pool",
                onPressed: () {
                  viewModel.navigateToHome();
                }),
            20.verticalSpace,
            TextButton(
              child: Text(
                "Earn more money",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: kcBlackColor, decoration: TextDecoration.underline),
              ),
              onPressed: () {
                viewModel.navigateToHome();
              },
            )
          ]),
        ),
      ),
    );
  }

  @override
  JobCompletedViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      JobCompletedViewModel();
}
