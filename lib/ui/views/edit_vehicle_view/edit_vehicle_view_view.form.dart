// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:rider/ui/form_validations/form_validator.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String MakeValueKey = 'make';
const String ModelValueKey = 'model';
const String YearValueKey = 'year';
const String LicensePlateValueKey = 'license_plate';
const String VehicleColorValueKey = 'vehicle_color';

final Map<String, TextEditingController>
    _EditVehicleViewViewTextEditingControllers = {};

final Map<String, FocusNode> _EditVehicleViewViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _EditVehicleViewViewTextValidations = {
  MakeValueKey: FormFieldsValidator.validateFieldEmpty,
  ModelValueKey: FormFieldsValidator.validateFieldEmpty,
  YearValueKey: FormFieldsValidator.validateFieldEmpty,
  LicensePlateValueKey: FormFieldsValidator.validateFieldEmpty,
  VehicleColorValueKey: FormFieldsValidator.validateFieldEmpty,
};

mixin $EditVehicleViewView {
  TextEditingController get makeController =>
      _getFormTextEditingController(MakeValueKey);
  TextEditingController get modelController =>
      _getFormTextEditingController(ModelValueKey);
  TextEditingController get yearController =>
      _getFormTextEditingController(YearValueKey);
  TextEditingController get licensePlateController =>
      _getFormTextEditingController(LicensePlateValueKey);
  TextEditingController get vehicleColorController =>
      _getFormTextEditingController(VehicleColorValueKey);

  FocusNode get makeFocusNode => _getFormFocusNode(MakeValueKey);
  FocusNode get modelFocusNode => _getFormFocusNode(ModelValueKey);
  FocusNode get yearFocusNode => _getFormFocusNode(YearValueKey);
  FocusNode get licensePlateFocusNode =>
      _getFormFocusNode(LicensePlateValueKey);
  FocusNode get vehicleColorFocusNode =>
      _getFormFocusNode(VehicleColorValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_EditVehicleViewViewTextEditingControllers.containsKey(key)) {
      return _EditVehicleViewViewTextEditingControllers[key]!;
    }

    _EditVehicleViewViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _EditVehicleViewViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_EditVehicleViewViewFocusNodes.containsKey(key)) {
      return _EditVehicleViewViewFocusNodes[key]!;
    }
    _EditVehicleViewViewFocusNodes[key] = FocusNode();
    return _EditVehicleViewViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    makeController.addListener(() => _updateFormData(model));
    modelController.addListener(() => _updateFormData(model));
    yearController.addListener(() => _updateFormData(model));
    licensePlateController.addListener(() => _updateFormData(model));
    vehicleColorController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    makeController.addListener(() => _updateFormData(model));
    modelController.addListener(() => _updateFormData(model));
    yearController.addListener(() => _updateFormData(model));
    licensePlateController.addListener(() => _updateFormData(model));
    vehicleColorController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          MakeValueKey: makeController.text,
          ModelValueKey: modelController.text,
          YearValueKey: yearController.text,
          LicensePlateValueKey: licensePlateController.text,
          VehicleColorValueKey: vehicleColorController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _EditVehicleViewViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _EditVehicleViewViewFocusNodes.values) {
      focusNode.dispose();
    }

    _EditVehicleViewViewTextEditingControllers.clear();
    _EditVehicleViewViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get makeValue => this.formValueMap[MakeValueKey] as String?;
  String? get modelValue => this.formValueMap[ModelValueKey] as String?;
  String? get yearValue => this.formValueMap[YearValueKey] as String?;
  String? get licensePlateValue =>
      this.formValueMap[LicensePlateValueKey] as String?;
  String? get vehicleColorValue =>
      this.formValueMap[VehicleColorValueKey] as String?;

  set makeValue(String? value) {
    this.setData(
      this.formValueMap..addAll({MakeValueKey: value}),
    );

    if (_EditVehicleViewViewTextEditingControllers.containsKey(MakeValueKey)) {
      _EditVehicleViewViewTextEditingControllers[MakeValueKey]?.text =
          value ?? '';
    }
  }

  set modelValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ModelValueKey: value}),
    );

    if (_EditVehicleViewViewTextEditingControllers.containsKey(ModelValueKey)) {
      _EditVehicleViewViewTextEditingControllers[ModelValueKey]?.text =
          value ?? '';
    }
  }

  set yearValue(String? value) {
    this.setData(
      this.formValueMap..addAll({YearValueKey: value}),
    );

    if (_EditVehicleViewViewTextEditingControllers.containsKey(YearValueKey)) {
      _EditVehicleViewViewTextEditingControllers[YearValueKey]?.text =
          value ?? '';
    }
  }

  set licensePlateValue(String? value) {
    this.setData(
      this.formValueMap..addAll({LicensePlateValueKey: value}),
    );

    if (_EditVehicleViewViewTextEditingControllers.containsKey(
        LicensePlateValueKey)) {
      _EditVehicleViewViewTextEditingControllers[LicensePlateValueKey]?.text =
          value ?? '';
    }
  }

  set vehicleColorValue(String? value) {
    this.setData(
      this.formValueMap..addAll({VehicleColorValueKey: value}),
    );

    if (_EditVehicleViewViewTextEditingControllers.containsKey(
        VehicleColorValueKey)) {
      _EditVehicleViewViewTextEditingControllers[VehicleColorValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasMake =>
      this.formValueMap.containsKey(MakeValueKey) &&
      (makeValue?.isNotEmpty ?? false);
  bool get hasModel =>
      this.formValueMap.containsKey(ModelValueKey) &&
      (modelValue?.isNotEmpty ?? false);
  bool get hasYear =>
      this.formValueMap.containsKey(YearValueKey) &&
      (yearValue?.isNotEmpty ?? false);
  bool get hasLicensePlate =>
      this.formValueMap.containsKey(LicensePlateValueKey) &&
      (licensePlateValue?.isNotEmpty ?? false);
  bool get hasVehicleColor =>
      this.formValueMap.containsKey(VehicleColorValueKey) &&
      (vehicleColorValue?.isNotEmpty ?? false);

  bool get hasMakeValidationMessage =>
      this.fieldsValidationMessages[MakeValueKey]?.isNotEmpty ?? false;
  bool get hasModelValidationMessage =>
      this.fieldsValidationMessages[ModelValueKey]?.isNotEmpty ?? false;
  bool get hasYearValidationMessage =>
      this.fieldsValidationMessages[YearValueKey]?.isNotEmpty ?? false;
  bool get hasLicensePlateValidationMessage =>
      this.fieldsValidationMessages[LicensePlateValueKey]?.isNotEmpty ?? false;
  bool get hasVehicleColorValidationMessage =>
      this.fieldsValidationMessages[VehicleColorValueKey]?.isNotEmpty ?? false;

  String? get makeValidationMessage =>
      this.fieldsValidationMessages[MakeValueKey];
  String? get modelValidationMessage =>
      this.fieldsValidationMessages[ModelValueKey];
  String? get yearValidationMessage =>
      this.fieldsValidationMessages[YearValueKey];
  String? get licensePlateValidationMessage =>
      this.fieldsValidationMessages[LicensePlateValueKey];
  String? get vehicleColorValidationMessage =>
      this.fieldsValidationMessages[VehicleColorValueKey];
}

extension Methods on FormStateHelper {
  setMakeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[MakeValueKey] = validationMessage;
  setModelValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ModelValueKey] = validationMessage;
  setYearValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[YearValueKey] = validationMessage;
  setLicensePlateValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LicensePlateValueKey] = validationMessage;
  setVehicleColorValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[VehicleColorValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    makeValue = '';
    modelValue = '';
    yearValue = '';
    licensePlateValue = '';
    vehicleColorValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      MakeValueKey: getValidationMessage(MakeValueKey),
      ModelValueKey: getValidationMessage(ModelValueKey),
      YearValueKey: getValidationMessage(YearValueKey),
      LicensePlateValueKey: getValidationMessage(LicensePlateValueKey),
      VehicleColorValueKey: getValidationMessage(VehicleColorValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _EditVehicleViewViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _EditVehicleViewViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      MakeValueKey: getValidationMessage(MakeValueKey),
      ModelValueKey: getValidationMessage(ModelValueKey),
      YearValueKey: getValidationMessage(YearValueKey),
      LicensePlateValueKey: getValidationMessage(LicensePlateValueKey),
      VehicleColorValueKey: getValidationMessage(VehicleColorValueKey),
    });
