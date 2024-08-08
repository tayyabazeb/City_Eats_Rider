import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/ui/dialogs/progress_indicator/progress.dart';
import 'package:rider/ui/form_validations/form_validator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import '../../buttons/custom_elevated_button.dart';
import '../../common/app_colors.dart';
import '../../widgets/common/custom_text_field/custom_text_field.dart';
import 'edit_address_view.form.dart';
import 'edit_address_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(
      name: 'street',
      validator: FormFieldsValidator.validateFieldEmpty,
    ),
    FormTextField(
      name: 'building',
      validator: FormFieldsValidator.validateFieldEmpty,
    ),
    FormTextField(
      name: 'city',
      validator: FormFieldsValidator.validateFieldEmpty,
    ),
    FormTextField(
      name: 'state',
      validator: FormFieldsValidator.validateFieldEmpty,
    ),
    FormTextField(
      name: 'zip_code',
      validator: FormFieldsValidator.validateFieldEmpty,
    ),
  ],
)
class EditAddressView extends StackedView<EditAddressViewModel>
    with $EditAddressView {
  const EditAddressView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, EditAddressViewModel viewModel, Widget? child) {
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
                  "What is your Address?",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: kcPrimaryColor),
                ),
              ),
              30.verticalSpace,
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    hintText: "Street Address",
                    onChanged: (val) {
                      viewModel.address.street = val ?? "";
                    },
                    controller: streetController,
                    focusNode: streetFocusNode,
                  )),
                  20.horizontalSpace,
                  Expanded(
                      child: CustomTextField(
                    hintText: "Building/Apt.",
                    onChanged: (val) {
                      viewModel.address.building = val ?? "";
                    },
                    controller: buildingController,
                    focusNode: buildingFocusNode,
                  )),
                ],
              ),
              // if (viewModel.isButtonClicked &&
              //     (!viewModel.hasStreet || !viewModel.hasBuilding))
              //   const ValidationWidget(
              //     message: "These fields are required",
              //     // "S.of(getContext).fieldRequiredText",
              //   ),
              20.verticalSpace,
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    hintText: "City",
                    onChanged: (val) {
                      viewModel.address.city = val ?? "";
                    },
                    controller: cityController,
                    focusNode: cityFocusNode,
                  )),
                  20.horizontalSpace,
                  Expanded(
                      child: CustomTextField(
                    hintText: "State",
                    onChanged: (val) {
                      viewModel.address.state = val ?? "";
                    },
                    controller: stateController,
                    focusNode: stateFocusNode,
                  )),
                ],
              ),
              // if (viewModel.isButtonClicked &&
              //     (!viewModel.hasCity || !viewModel.hasState))
              //   const ValidationWidget(
              //     message: "These fields are required",
              //     // "S.of(getContext).fieldRequiredText",
              //   ),
              20.verticalSpace,
              CustomTextField(
                hintText: "Zip Code",
                onChanged: (val) {
                  viewModel.address.zipCode = val ?? "";
                },
                controller: zipCodeController,
                focusNode: zipCodeFocusNode,
                // textInputType: TextInputType.number,
              ),
              // if (viewModel.isButtonClicked && !viewModel.hasZipCode)
              //   const ValidationWidget(
              //     message: "This field is required",
              //     // "S.of(getContext).fieldRequiredText",
              //   ),
              40.verticalSpace,
              CustomElevatedButton(
                  onPressed: () {
                    viewModel.buttonClick();
                    // if (
                    // viewModel.isFormValid &&
                    //   viewModel.hasStreet &&
                    //   viewModel.hasBuilding &&
                    //   viewModel.hasCity &&
                    //   viewModel.hasState &&
                    //   viewModel.hasZipCode) {
                    viewModel.updateAddress();
                    // }
                  },
                  text: "Update"),
            ]),
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(EditAddressViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    viewModel.getCurrentLocation();
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(EditAddressViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  EditAddressViewModel viewModelBuilder(BuildContext context) =>
      EditAddressViewModel();
}
