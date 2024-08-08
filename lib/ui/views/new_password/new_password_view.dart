import 'package:flutter/material.dart';
import 'package:rider/ui/form_validations/form_validator.dart';
import 'package:rider/ui/snackbars/custom_snackbar.dart';
import 'package:rider/ui/views/new_password/new_password_view.form.dart';
import 'package:rider/ui/widgets/validation_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'new_password_viewmodel.dart';
import 'package:rider/constants/asesets.dart';
import 'package:rider/ui/buttons/custom_elevated_button.dart';
import 'package:rider/ui/common/app_colors.dart';
import 'package:rider/ui/dialogs/progress_indicator/progress.dart';
import 'package:rider/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

@FormView(
  fields: [
    FormTextField(
      name: 'new_pass',
      validator: FormFieldsValidator.validatePassword,
    ),
    FormTextField(
      name: 'c_password',
      validator: FormFieldsValidator.validatePassword,
    ),
  ],
)
class NewPasswordView extends StackedView<NewPasswordViewModel>
    with $NewPasswordView {
  final String email;
  const NewPasswordView({Key? key, required this.email}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, NewPasswordViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomProgressIndicator(
        isLoading: viewModel.isBusy,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    viewModel.navigationService.back();
                  },
                ),
                30.verticalSpace,
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Reset Password",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 22.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                30.verticalSpace,
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "$kcStaticImagesPath/forgot/new-password.png",
                    height: 191.h,
                    width: 214.w,
                  )
                      .animate()
                      .fadeIn(duration: 800.ms)
                      .scale()
                      .then(delay: 400.ms),
                ),
                20.verticalSpace,
                RichText(
                  text: TextSpan(
                      text: "Enter otp you have received on email address ",
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: email,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        )
                      ]),
                ),
                // Text(
                //   "Enter otp you have received on email address $email",
                //   style: Theme.of(context).textTheme.bodyMedium,
                // ),
                10.verticalSpace,
                Align(
                  alignment: Alignment.center,
                  child: Pinput(
                    cursor: Container(
                      width: 1,
                      height: 32.h,
                      decoration: BoxDecoration(
                        color: kChineseBlackColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    autofocus: true,
                    length: 4,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    defaultPinTheme: pinTheme(context),
                    focusedPinTheme: pinTheme(context).copyWith(
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        border: Border.all(color: kcPrimaryColor),
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: [
                          BoxShadow(
                              color: kcPrimaryColor.withOpacity(0.3),
                              blurRadius: 8.r,
                              spreadRadius: 3.r
                              // offset: const Offset(0, 5),
                              ),
                        ],
                      ),
                    ),
                    onChanged: viewModel.onChangeOTP,
                  ),
                ),
                20.verticalSpace,
                Text(
                  "Create new password",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                10.verticalSpace,
                CustomTextField(
                  hintText: "***********",
                  prefix: const Icon(Icons.lock),
                  obscure: viewModel.passwordHidden,
                  controller: newPassController,
                  focusNode: newPassFocusNode,
                  noSpace: true,
                  onChanged: (val) {
                    viewModel.newPass = val?.trim() ?? "";
                  },
                  suffix: IconButton(
                    splashRadius: 10.r,
                    onPressed: () {
                      viewModel.togglePassVisibility();
                    },
                    icon: Icon(
                      viewModel.passwordHidden
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 20,
                      color: kSlateGrayColor,
                    ),
                  ),
                ),

                ///
                if (viewModel.hasNewPassValidationMessage)
                  ValidationWidget(
                    message: viewModel.newPassValidationMessage ??
                        "This field is required",
                  ),
                15.verticalSpace,
                Text(
                  "Confirm password",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                10.verticalSpace,
                CustomTextField(
                  hintText: "*************",
                  prefix: const Icon(Icons.lock),
                  textInputType: TextInputType.name,
                  obscure: viewModel.cPasswordHidden,
                  controller: cPasswordController,
                  focusNode: cPasswordFocusNode,
                  noSpace: true,
                  onChanged: (val) {
                    viewModel.cNewPass = val?.trim() ?? "";
                  },
                  suffix: IconButton(
                    splashRadius: 10.r,
                    onPressed: () {
                      viewModel.toggleCPassVisibility();
                    },
                    icon: Icon(
                      viewModel.cPasswordHidden
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 20,
                      color: kSlateGrayColor,
                    ),
                  ),
                ),
                if (viewModel.newPass != viewModel.cNewPass)
                  const ValidationWidget(
                    message: "Password and confirm password are not matching",
                  ),
                40.verticalSpace,
                CustomElevatedButton(
                    text: 'Change Password',
                    // backgroundColor: viewModel.otp.length == 4 ||
                    //         newPassController.text.trim() ==
                    //             cPasswordController.text.trim()
                    //     ? kcPrimaryColor
                    //     : kcGreyColor,
                    onPressed: viewModel.otp.length != 4 ||
                            viewModel.hasNewPass &&
                                viewModel.hasCPassword &&
                                newPassController.text.trim() !=
                                    cPasswordController.text.trim()
                        ? null
                        : () {
                            ///
                            if (viewModel.otp.length == 4 &&
                                viewModel.hasNewPass &&
                                viewModel.hasCPassword &&
                                newPassController.text.trim() ==
                                    cPasswordController.text.trim()) {
                              viewModel.requestNewPassword();
                            } else {
                              showSnackBar(context);
                            }
                          })
              ],
            ),
          ),
        ),
      ),
    );
  }

  PinTheme pinTheme(_) => PinTheme(
        height: 52.w,
        width: 52.w,
        textStyle: Theme.of(_).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
        decoration: BoxDecoration(
          color: kcWhiteColor,
          border: Border.all(color: kSilverLightColor),
          borderRadius: BorderRadius.circular(8.r),
        ),
      );

  @override
  void onViewModelReady(NewPasswordViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(NewPasswordViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  NewPasswordViewModel viewModelBuilder(BuildContext context) =>
      NewPasswordViewModel(context, email);
}
