// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:rider/responses/documents_response.dart';
import 'package:rider/ui/common/ui_helpers.dart';
import 'package:rider/ui/dialogs/progress_indicator/progress.dart';
import 'package:rider/ui/form_validations/form_validator.dart';
import 'package:rider/ui/views/identity_verification/identity_verification_view.form.dart';
import 'package:rider/ui/widgets/common/cache_network_image.dart';
import 'package:rider/ui/widgets/validation_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../constants/asesets.dart';
import '../../buttons/custom_elevated_button.dart';
import '../../common/app_colors.dart';
import '../../widgets/common/custom_text_field/custom_text_field.dart';
import 'identity_verification_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(
      name: 'issue_date',
      validator: FormFieldsValidator.validateFieldEmpty,
    ),
    FormTextField(
      name: 'expiry',
      validator: FormFieldsValidator.validateFieldEmpty,
    ),
    FormTextField(
      name: 'license',
      validator: FormFieldsValidator.validateFieldEmpty,
    ),
    FormTextField(
      name: 'issuing_date',
      validator: FormFieldsValidator.validateFieldEmpty,
    ),
  ],
)
class IdentityVerificationView
    extends StackedView<IdentityVerificationViewModel>
    with $IdentityVerificationView {
  const IdentityVerificationView({Key? key, this.document}) : super(key: key);
  final Document? document;

  @override
  Widget builder(BuildContext context, IdentityVerificationViewModel viewModel,
      Widget? child) {
    return CustomProgressIndicator(
      isLoading: viewModel.isBusy,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Container(
          padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 70.h),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  viewModel.back();
                },
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
              20.verticalSpace,
              Center(
                child: Text(
                  "Upload Your Driving License",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: kcPrimaryColor),
                ),
              ),
              30.verticalSpace,
              SizedBox(
                width: screenWidth(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Front Image",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontSize: 12.sp)),
                          8.verticalSpace,
                          InkWell(
                            onTap: () async {
                              XFile? file =
                                  await viewModel.getImageFromGallery(context);
                              if (file != null) {
                                final res = await _showFullScreenImage(
                                    context, File(file.path));
                                if (res) {
                                  viewModel.licenseBody.frontImage =
                                      File(file.path);
                                  viewModel.notifyListeners();
                                }
                              }
                            },
                            child: Container(
                              height: 112.h,
                              width: screenWidth(context) / 2.5,
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    fit: BoxFit.contain,
                                    image: AssetImage(
                                        "$kcStaticImagesPath/identity.png"),
                                  ),
                                  border: Border.all(color: kcGreyColor),
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: viewModel.licenseBody.frontImage != null
                                  ? Image.file(File(
                                      viewModel.licenseBody.frontImage!.path))
                                  : document != null
                                      ? NetworkImageWidget(
                                          url: document?.frontImage ?? "")
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                              const CircleAvatar(
                                                backgroundColor: kcPrimaryColor,
                                                child: Icon(
                                                    Icons.camera_alt_outlined),
                                              ),
                                              Text(
                                                "Front",
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                        fontSize: 12.sp,
                                                        color: kcDarkGreyColor),
                                              ),
                                            ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Back Image",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontSize: 12.sp)),
                          8.verticalSpace,
                          InkWell(
                            onTap: () async {
                              XFile? file =
                                  await viewModel.getImageFromGallery(context);
                              if (file != null) {
                                final res = await _showFullScreenImage(
                                    context, File(file.path));
                                if (res) {
                                  viewModel.licenseBody.backImage =
                                      File(file.path);
                                  viewModel.notifyListeners();
                                }
                              }
                            },
                            child: Container(
                              height: 112.h,
                              width: screenWidth(context) / 2.5,
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    fit: BoxFit.contain,
                                    image: AssetImage(
                                        "$kcStaticImagesPath/identity.png"),
                                  ),
                                  border: Border.all(color: kcGreyColor),
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: viewModel.licenseBody.backImage != null
                                  ? Image.file(File(
                                      viewModel.licenseBody.backImage!.path))
                                  : document != null
                                      ? NetworkImageWidget(
                                          url: document?.backImage ?? "")
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                              const CircleAvatar(
                                                backgroundColor: kcPrimaryColor,
                                                child: Icon(
                                                    Icons.camera_alt_outlined),
                                              ),
                                              Text(
                                                "Back",
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                        fontSize: 11.sp,
                                                        color: kcDarkGreyColor),
                                              ),
                                            ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (document == null)
                if (viewModel.isButtonClicked &&
                    (viewModel.licenseBody.frontImage == null ||
                        viewModel.licenseBody.backImage == null))
                  const ValidationWidget(
                      message: "Front and back images and required"),
              20.verticalSpace,
              Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Issue Date",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 12.sp)),
                      8.verticalSpace,
                      CustomTextField(
                        hintText: "Issue Date",
                        textCapitalization: TextCapitalization.words,
                        onChanged: (val) {
                          viewModel.licenseBody.issueDate = val ?? "";
                        },
                        onTap: () async {
                          issueDateFocusNode.canRequestFocus = false;
                          issueDateFocusNode.unfocus();
                          String? date = await selectDateOfBirth(context);
                          print(date);
                          if (date != null) {
                            viewModel.licenseBody.issueDate = date;
                            issueDateController.text = date;
                          }
                        },
                        controller: issueDateController,
                        focusNode: issueDateFocusNode,
                      ),
                    ],
                  )),
                  if (viewModel.isButtonClicked && !viewModel.hasIssueDate)
                    const ValidationWidget(
                      message: "This field is required",
                      // "S.of(getContext).fieldRequiredText",
                    ),
                  20.horizontalSpace,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Expiry",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 12.sp)),
                      8.verticalSpace,
                      CustomTextField(
                        hintText: "Expiry",
                        textCapitalization: TextCapitalization.words,
                        onChanged: (val) {
                          viewModel.licenseBody.expiryDate = val ?? "";
                        },
                        onTap: () async {
                          expiryFocusNode.canRequestFocus = false;
                          expiryFocusNode.unfocus();
                          String? date = await selectDateOfBirth(context);
                          print(date);
                          if (date != null) {
                            viewModel.licenseBody.expiryDate = date;
                            expiryController.text = date;
                          }
                        },
                        controller: expiryController,
                        focusNode: expiryFocusNode,
                      ),
                    ],
                  )),
                ],
              ),
              if (viewModel.isButtonClicked && !viewModel.hasExpiry)
                const ValidationWidget(
                  message: "This field is required",
                  // "S.of(getContext).fieldRequiredText",
                ),
              // 20.verticalSpace,
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              // Text("License No",
              //     style: Theme.of(context)
              //         .textTheme
              //         .bodyMedium
              //         ?.copyWith(fontSize: 12.sp)),
              // 8.verticalSpace,
              // CustomTextField(
              //   hintText: "License No",
              //   textCapitalization: TextCapitalization.words,
              //   onChanged: (val) {
              //     viewModel.licenseBody.licenseNo = val ?? "";
              //   },
              //   controller: licenseController,
              //   focusNode: licenseFocusNode,
              // ),
              //   ],
              // ),
              // if (viewModel.isButtonClicked && !viewModel.hasLicense)
              //   const ValidationWidget(
              //     message: "This field is required",

              //     // "S.of(getContext).fieldRequiredText",
              //   ),
              20.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Issuing State",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 12.sp)),
                  8.verticalSpace,
                  CustomTextField(
                    hintText: "Issuing State",
                    textCapitalization: TextCapitalization.words,
                    onChanged: (val) {
                      viewModel.licenseBody.issuingState = val ?? "";
                    },
                    controller: issuingDateController,
                    focusNode: issuingDateFocusNode,
                  ),
                ],
              ),
              if (viewModel.isButtonClicked && !viewModel.hasIssuingDate)
                const ValidationWidget(
                  message: "This field is required",
                  // "S.of(getContext).fieldRequiredText",
                ),
              40.verticalSpace,
              CustomElevatedButton(
                  onPressed: () {
                    print(viewModel.licenseBody.toJson());
                    viewModel.buttonClicked();
                    if (document == null) {
                      if (viewModel.licenseBody.frontImage != null &&
                              viewModel.licenseBody.backImage != null &&
                              viewModel.hasIssueDate &&
                              viewModel.hasExpiry &&
                              viewModel.hasIssuingDate
                          // &&
                          // viewModel.hasLicense
                          ) {
                        viewModel.addIdentity();
                      }
                    } else if (issueDateController.text.isNotEmpty &&
                        expiryController.text.isNotEmpty &&
                        issuingDateController.text.isNotEmpty &&
                        licenseController.text.isNotEmpty) {
                      viewModel.updateIdentity();
                    }
                  },
                  text: document != null ? "Submit" : "Submit for Review"),
            ]),
          ),
        ),
      ),
    );
  }

  Future<String?> selectDateOfBirth(context, {DateTime? initialDate}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDatePickerMode: DatePickerMode.day,
      keyboardType: TextInputType.datetime,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2050),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: kcPrimaryColor, // header background color
              onPrimary: kcCetaceanBlueColor, // header text color
              onSurface: kcBlackColor, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
                // button text color
                style: TextButton.styleFrom(foregroundColor: kcPrimaryColor))),
        child: child!,
      ),
    );
    return pickedDate != null
        ? DateFormat('yyyy-MM-dd').format(pickedDate)
        : null;
  }

  _showFullScreenImage(BuildContext context, File imageFile) async {
    final res = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            backgroundColor: kcPrimaryColor,
            child: const Icon(Icons.play_arrow),
          ),
          body: Center(child: Image.file(imageFile, fit: BoxFit.cover)),
        ),
      ),
    );
    return res;
  }

  @override
  void onViewModelReady(IdentityVerificationViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    syncData();
    super.onViewModelReady(viewModel);
  }

  syncData() {
    expiryController.text = document?.expiryDate ?? "";
    issueDateController.text = document?.issueDate ?? "";
    issuingDateController.text = document?.issuingState ?? "";
    licenseController.text = document?.licenseNo ?? "";
  }

  @override
  void onDispose(IdentityVerificationViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  IdentityVerificationViewModel viewModelBuilder(BuildContext context) =>
      IdentityVerificationViewModel(document);
}
