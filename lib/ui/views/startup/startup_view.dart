import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/constants/asesets.dart';
import 'package:stacked/stacked.dart';
import 'package:rider/ui/common/ui_helpers.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, StartupViewModel viewModel, Widget? child) {
    return Scaffold(
      // backgroundColor: Colors.green[900],
      body: Stack(
        children: [
          SizedBox(
            width: screenWidth(context),
            height: screenHeight(context),
            child: Image.asset(
              "$kcStaticImagesPath/splash/splash_back.png",
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
              top: 0,
              bottom: 0,
              left: 80.w,
              right: 80.w,
              child: Image.asset(
                "$kcStaticImagesPath/splash/splash_logo.png",
                fit: BoxFit.contain,
              ))
        ],
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
