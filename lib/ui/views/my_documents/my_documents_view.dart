import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rider/ui/common/app_colors.dart';
import 'package:rider/ui/common/ui_helpers.dart';
import 'package:rider/ui/dialogs/progress_indicator/progress.dart';
import 'package:stacked/stacked.dart';

import 'my_documents_viewmodel.dart';

class MyDocumentsView extends StackedView<MyDocumentsViewModel> {
  const MyDocumentsView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, MyDocumentsViewModel viewModel, Widget? child) {
    return CustomProgressIndicator(
      isLoading: viewModel.isBusy,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
            title: Text(
          "Driving License",
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        )),
        body: Container(
          padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 50.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Text(
                  "Driving License  ",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: kcPrimaryColor,
                      ),
                ),
                Text(
                  // "(Expires on 03/2022 )",
                  "(Expires on ${viewModel.document?.expiryDate} )",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 12.sp
                          // fontWeight: FontWeight.bold,
                          ),
                ),
              ],
            ),
            20.verticalSpace,
            Text("License Front",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 12.sp)),
            8.verticalSpace,
            InkWell(
              onTap: () {
                if (viewModel.document?.frontImage != null) {
                  _showFullScreenImage(
                      context, viewModel.document?.frontImage ?? "");
                }
              },
              child: Container(
                height: 180.h,
                width: screenWidth(context),
                decoration: BoxDecoration(
                  border: Border.all(color: kcGreyColor, width: 0.5),
                  borderRadius: BorderRadius.circular(10.r),
                  color: kcGreyColor,
                ),
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                child: Image.network(
                  // Replace with your image URL
                  viewModel.document?.frontImage ?? "",
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) => Container(),
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      // setState(() {
                      //   isLoading = false;
                      // });
                      return child;
                    } else {
                      return const SpinKitFadingCircle(
                          color: kcPrimaryColor, size: 30);
                    }
                  },
                ),
                // NetworkImageWidget(
                //     url: viewModel.document?.frontImage ?? ""),
              ),
            ),
            20.verticalSpace,
            Text("License Back",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 12.sp)),
            8.verticalSpace,
            InkWell(
              onTap: () {
                if (viewModel.document?.backImage != null) {
                  _showFullScreenImage(
                      context, viewModel.document?.backImage ?? "");
                }
              },
              child: Container(
                height: 180.h,
                width: screenWidth(context),
                decoration: BoxDecoration(
                  border: Border.all(color: kcGreyColor),
                  color: kcGreyColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                child: Image.network(
                  // Replace with your image URL
                  viewModel.document?.backImage ?? "",
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) => Container(),
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      // setState(() {
                      //   isLoading = false;
                      // });
                      return child;
                    } else {
                      return SizedBox(
                          height: 20.h,
                          width: 20.w,
                          child: const CircularProgressIndicator(
                            color: kcPrimaryColor,
                          )); // Loader
                    }
                  },
                ),
                // NetworkImageWidget(
                //     url: viewModel.document?.backImage ?? ""),
              ),
            ),
            20.verticalSpace,
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  viewModel.navigateToUpdateDocuments();
                },
                child: Text("Update Driving License",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: kcPrimaryColor,
                        height: 1.3,
                        decoration: TextDecoration.underline)),
              ),
            )
          ]),
        ),
      ),
    );
  }

  _showFullScreenImage(BuildContext context, String imageFile) async {
    final res = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     Navigator.pop(context, true);
          //   },
          //   backgroundColor: kcPrimaryColor,
          //   child: const Icon(Icons.play_arrow),
          // ),
          body: Center(child: Image.network(imageFile, fit: BoxFit.cover)),
        ),
      ),
    );
    return res;
  }

  @override
  MyDocumentsViewModel viewModelBuilder(BuildContext context) =>
      MyDocumentsViewModel();
}
