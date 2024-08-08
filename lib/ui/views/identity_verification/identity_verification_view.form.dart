// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:rider/ui/form_validations/form_validator.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String IssueDateValueKey = 'issue_date';
const String ExpiryValueKey = 'expiry';
const String LicenseValueKey = 'license';
const String IssuingDateValueKey = 'issuing_date';

final Map<String, TextEditingController>
    _IdentityVerificationViewTextEditingControllers = {};

final Map<String, FocusNode> _IdentityVerificationViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _IdentityVerificationViewTextValidations = {
  IssueDateValueKey: FormFieldsValidator.validateFieldEmpty,
  ExpiryValueKey: FormFieldsValidator.validateFieldEmpty,
  LicenseValueKey: FormFieldsValidator.validateFieldEmpty,
  IssuingDateValueKey: FormFieldsValidator.validateFieldEmpty,
};

mixin $IdentityVerificationView {
  TextEditingController get issueDateController =>
      _getFormTextEditingController(IssueDateValueKey);
  TextEditingController get expiryController =>
      _getFormTextEditingController(ExpiryValueKey);
  TextEditingController get licenseController =>
      _getFormTextEditingController(LicenseValueKey);
  TextEditingController get issuingDateController =>
      _getFormTextEditingController(IssuingDateValueKey);

  FocusNode get issueDateFocusNode => _getFormFocusNode(IssueDateValueKey);
  FocusNode get expiryFocusNode => _getFormFocusNode(ExpiryValueKey);
  FocusNode get licenseFocusNode => _getFormFocusNode(LicenseValueKey);
  FocusNode get issuingDateFocusNode => _getFormFocusNode(IssuingDateValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_IdentityVerificationViewTextEditingControllers.containsKey(key)) {
      return _IdentityVerificationViewTextEditingControllers[key]!;
    }

    _IdentityVerificationViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _IdentityVerificationViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_IdentityVerificationViewFocusNodes.containsKey(key)) {
      return _IdentityVerificationViewFocusNodes[key]!;
    }
    _IdentityVerificationViewFocusNodes[key] = FocusNode();
    return _IdentityVerificationViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    issueDateController.addListener(() => _updateFormData(model));
    expiryController.addListener(() => _updateFormData(model));
    licenseController.addListener(() => _updateFormData(model));
    issuingDateController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    issueDateController.addListener(() => _updateFormData(model));
    expiryController.addListener(() => _updateFormData(model));
    licenseController.addListener(() => _updateFormData(model));
    issuingDateController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          IssueDateValueKey: issueDateController.text,
          ExpiryValueKey: expiryController.text,
          LicenseValueKey: licenseController.text,
          IssuingDateValueKey: issuingDateController.text,
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

    for (var controller
        in _IdentityVerificationViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _IdentityVerificationViewFocusNodes.values) {
      focusNode.dispose();
    }

    _IdentityVerificationViewTextEditingControllers.clear();
    _IdentityVerificationViewFocusNodes.clear();
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

  String? get issueDateValue => this.formValueMap[IssueDateValueKey] as String?;
  String? get expiryValue => this.formValueMap[ExpiryValueKey] as String?;
  String? get licenseValue => this.formValueMap[LicenseValueKey] as String?;
  String? get issuingDateValue =>
      this.formValueMap[IssuingDateValueKey] as String?;

  set issueDateValue(String? value) {
    this.setData(
      this.formValueMap..addAll({IssueDateValueKey: value}),
    );

    if (_IdentityVerificationViewTextEditingControllers.containsKey(
        IssueDateValueKey)) {
      _IdentityVerificationViewTextEditingControllers[IssueDateValueKey]?.text =
          value ?? '';
    }
  }

  set expiryValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ExpiryValueKey: value}),
    );

    if (_IdentityVerificationViewTextEditingControllers.containsKey(
        ExpiryValueKey)) {
      _IdentityVerificationViewTextEditingControllers[ExpiryValueKey]?.text =
          value ?? '';
    }
  }

  set licenseValue(String? value) {
    this.setData(
      this.formValueMap..addAll({LicenseValueKey: value}),
    );

    if (_IdentityVerificationViewTextEditingControllers.containsKey(
        LicenseValueKey)) {
      _IdentityVerificationViewTextEditingControllers[LicenseValueKey]?.text =
          value ?? '';
    }
  }

  set issuingDateValue(String? value) {
    this.setData(
      this.formValueMap..addAll({IssuingDateValueKey: value}),
    );

    if (_IdentityVerificationViewTextEditingControllers.containsKey(
        IssuingDateValueKey)) {
      _IdentityVerificationViewTextEditingControllers[IssuingDateValueKey]
          ?.text = value ?? '';
    }
  }

  bool get hasIssueDate =>
      this.formValueMap.containsKey(IssueDateValueKey) &&
      (issueDateValue?.isNotEmpty ?? false);
  bool get hasExpiry =>
      this.formValueMap.containsKey(ExpiryValueKey) &&
      (expiryValue?.isNotEmpty ?? false);
  bool get hasLicense =>
      this.formValueMap.containsKey(LicenseValueKey) &&
      (licenseValue?.isNotEmpty ?? false);
  bool get hasIssuingDate =>
      this.formValueMap.containsKey(IssuingDateValueKey) &&
      (issuingDateValue?.isNotEmpty ?? false);

  bool get hasIssueDateValidationMessage =>
      this.fieldsValidationMessages[IssueDateValueKey]?.isNotEmpty ?? false;
  bool get hasExpiryValidationMessage =>
      this.fieldsValidationMessages[ExpiryValueKey]?.isNotEmpty ?? false;
  bool get hasLicenseValidationMessage =>
      this.fieldsValidationMessages[LicenseValueKey]?.isNotEmpty ?? false;
  bool get hasIssuingDateValidationMessage =>
      this.fieldsValidationMessages[IssuingDateValueKey]?.isNotEmpty ?? false;

  String? get issueDateValidationMessage =>
      this.fieldsValidationMessages[IssueDateValueKey];
  String? get expiryValidationMessage =>
      this.fieldsValidationMessages[ExpiryValueKey];
  String? get licenseValidationMessage =>
      this.fieldsValidationMessages[LicenseValueKey];
  String? get issuingDateValidationMessage =>
      this.fieldsValidationMessages[IssuingDateValueKey];
}

extension Methods on FormStateHelper {
  setIssueDateValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[IssueDateValueKey] = validationMessage;
  setExpiryValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ExpiryValueKey] = validationMessage;
  setLicenseValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LicenseValueKey] = validationMessage;
  setIssuingDateValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[IssuingDateValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    issueDateValue = '';
    expiryValue = '';
    licenseValue = '';
    issuingDateValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      IssueDateValueKey: getValidationMessage(IssueDateValueKey),
      ExpiryValueKey: getValidationMessage(ExpiryValueKey),
      LicenseValueKey: getValidationMessage(LicenseValueKey),
      IssuingDateValueKey: getValidationMessage(IssuingDateValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _IdentityVerificationViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _IdentityVerificationViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      IssueDateValueKey: getValidationMessage(IssueDateValueKey),
      ExpiryValueKey: getValidationMessage(ExpiryValueKey),
      LicenseValueKey: getValidationMessage(LicenseValueKey),
      IssuingDateValueKey: getValidationMessage(IssuingDateValueKey),
    });
