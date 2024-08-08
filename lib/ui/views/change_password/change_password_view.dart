import 'package:flutter/material.dart';
import 'package:rider/ui/form_validations/form_validator.dart';
import 'package:rider/ui/widgets/validation_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:rider/ui/buttons/custom_elevated_button.dart';
import 'package:rider/ui/common/app_colors.dart';
import 'package:rider/ui/dialogs/progress_indicator/progress.dart';
import 'package:rider/ui/views/change_password/change_password_view.form.dart';
import 'package:rider/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'change_password_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'password',
    validator: FormFieldsValidator.validatePassword,
  ),
  FormTextField(
    name: 'new_password',
    validator: FormFieldsValidator.validatePassword,
  ),
  FormTextField(
    name: 'confirm_password',
  )
])
class ChangePasswordView extends StackedView<ChangePasswordViewModel>
    with $ChangePasswordView {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, ChangePasswordViewModel viewModel, Widget? child) {
    return CustomProgressIndicator(
      isLoading: viewModel.isBusy,
      child: Scaffold(
        appBar: AppBar(shadowColor: kcWhitColor),
        backgroundColor: kcWhitColor,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Change Password",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w400),
              ),
              30.verticalSpace,

              ///
              const Text("Old Password"),
              8.verticalSpace,
              CustomTextField(
                hintText: "**********",
                controller: passwordController,
                focusNode: passwordFocusNode,
                obscure: viewModel.oldPasswordHidden,
                prefix: const Icon(Icons.lock),
                noSpace: true,
                onEditingComplete: () {
                  newPasswordFocusNode.requestFocus();
                },
                suffix: IconButton(
                  splashRadius: 10.r,
                  onPressed: () {
                    viewModel.toggleOldPassVisibility();
                  },
                  icon: Icon(
                    viewModel.oldPasswordHidden
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 20,
                    color: kSlateGrayColor,
                  ),
                ),
              ),
              if (viewModel.hasPasswordValidationMessage)
                ValidationWidget(
                    message: viewModel.passwordValidationMessage ??
                        "Please enter old password"),
              10.verticalSpace,
              const Text("New Password"),
              8.verticalSpace,
              CustomTextField(
                hintText: "********",
                controller: newPasswordController,
                focusNode: newPasswordFocusNode,
                prefix: const Icon(Icons.lock),
                obscure: viewModel.newPasswordHidden,
                noSpace: true,
                onEditingComplete: () {
                  confirmPasswordFocusNode.requestFocus();
                },
                suffix: IconButton(
                  splashRadius: 10.r,
                  onPressed: () {
                    viewModel.toggleNewPassVisibility();
                  },
                  icon: Icon(
                    viewModel.newPasswordHidden
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 20,
                    color: kSlateGrayColor,
                  ),
                ),
              ),
              if (viewModel.hasNewPasswordValidationMessage)
                ValidationWidget(
                    message: viewModel.newPasswordValidationMessage ??
                        "Please Enter new password"),
              10.verticalSpace,
              const Text("Confirm Password"),
              8.verticalSpace,
              CustomTextField(
                hintText: "********",
                controller: confirmPasswordController,
                focusNode: confirmPasswordFocusNode,
                prefix: const Icon(Icons.lock),
                obscure: viewModel.cPasswordHidden,
                onEditingComplete: () {
                  confirmPasswordFocusNode.unfocus();
                },
                noSpace: true,
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
              if (newPasswordController.text.trim() !=
                  confirmPasswordController.text.trim())
                const ValidationWidget(
                    message: "Password and confirm password are not matching"),
              60.verticalSpace,

              ///
              CustomElevatedButton(
                text: "Done",
                onPressed: !viewModel.hasPasswordValidationMessage &&
                        !viewModel.hasNewPasswordValidationMessage &&
                        viewModel.hasPassword &&
                        viewModel.hasNewPassword &&
                        viewModel.hasConfirmPassword &&
                        newPasswordController.text.trim() ==
                            confirmPasswordController.text.trim()
                    ? () {
                        viewModel.requestPasswordChange(context);
                      }
                    : null,
              )
            ]),
          ),
        ),
      ),
    );
  }

  @override
  void onDispose(ChangePasswordViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  void onViewModelReady(ChangePasswordViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  ChangePasswordViewModel viewModelBuilder(BuildContext context) =>
      ChangePasswordViewModel();
}
