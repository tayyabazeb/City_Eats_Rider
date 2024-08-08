import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rider/app/app.locator.dart';
import 'package:rider/app/app.router.dart';
import 'package:rider/ui/buttons/custom_elevated_button.dart';
import 'package:rider/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'approval_viewmodel.dart';

class ApprovalView extends StackedView<ApprovalViewModel> {
  const ApprovalView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ApprovalViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: kcPrimaryColor,
                    width: 8,
                  ),
                  borderRadius: BorderRadius.circular(50.r)),
              child: Center(
                child: Text(
                  "i",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: kcPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.acme().fontFamily,
                      fontSize: 50.sp),
                ),
              ),
            ),
            30.verticalSpace,
            Text(
              "Your new driver registration request has been successfully sent. Please wait for admin to approve your request. After approving your account you access all the features of the application",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    letterSpacing: 1.1,
                  ),
            ),
            50.verticalSpace,
            CustomElevatedButton(
                text: "Ok",
                onPressed: () {
                  // exit(0);
                  locator<NavigationService>().navigateToHomeView();
                })
          ],
        ),
      ),
    );
  }

  @override
  ApprovalViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ApprovalViewModel();
}
