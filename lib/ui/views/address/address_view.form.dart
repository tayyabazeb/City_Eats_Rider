// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:rider/ui/form_validations/form_validator.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String StreetValueKey = 'street';
const String BuildingValueKey = 'building';
const String CityValueKey = 'city';
const String StateValueKey = 'state';
const String ZipCodeValueKey = 'zip_code';

final Map<String, TextEditingController> _AddressViewTextEditingControllers =
    {};

final Map<String, FocusNode> _AddressViewFocusNodes = {};

final Map<String, String? Function(String?)?> _AddressViewTextValidations = {
  StreetValueKey: FormFieldsValidator.validateFieldEmpty,
  BuildingValueKey: FormFieldsValidator.validateFieldEmpty,
  CityValueKey: FormFieldsValidator.validateFieldEmpty,
  StateValueKey: FormFieldsValidator.validateFieldEmpty,
  ZipCodeValueKey: FormFieldsValidator.validateFieldEmpty,
};

mixin $AddressView {
  TextEditingController get streetController =>
      _getFormTextEditingController(StreetValueKey);
  TextEditingController get buildingController =>
      _getFormTextEditingController(BuildingValueKey);
  TextEditingController get cityController =>
      _getFormTextEditingController(CityValueKey);
  TextEditingController get stateController =>
      _getFormTextEditingController(StateValueKey);
  TextEditingController get zipCodeController =>
      _getFormTextEditingController(ZipCodeValueKey);

  FocusNode get streetFocusNode => _getFormFocusNode(StreetValueKey);
  FocusNode get buildingFocusNode => _getFormFocusNode(BuildingValueKey);
  FocusNode get cityFocusNode => _getFormFocusNode(CityValueKey);
  FocusNode get stateFocusNode => _getFormFocusNode(StateValueKey);
  FocusNode get zipCodeFocusNode => _getFormFocusNode(ZipCodeValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_AddressViewTextEditingControllers.containsKey(key)) {
      return _AddressViewTextEditingControllers[key]!;
    }

    _AddressViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AddressViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AddressViewFocusNodes.containsKey(key)) {
      return _AddressViewFocusNodes[key]!;
    }
    _AddressViewFocusNodes[key] = FocusNode();
    return _AddressViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    streetController.addListener(() => _updateFormData(model));
    buildingController.addListener(() => _updateFormData(model));
    cityController.addListener(() => _updateFormData(model));
    stateController.addListener(() => _updateFormData(model));
    zipCodeController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    streetController.addListener(() => _updateFormData(model));
    buildingController.addListener(() => _updateFormData(model));
    cityController.addListener(() => _updateFormData(model));
    stateController.addListener(() => _updateFormData(model));
    zipCodeController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          StreetValueKey: streetController.text,
          BuildingValueKey: buildingController.text,
          CityValueKey: cityController.text,
          StateValueKey: stateController.text,
          ZipCodeValueKey: zipCodeController.text,
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

    for (var controller in _AddressViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AddressViewFocusNodes.values) {
      focusNode.dispose();
    }

    _AddressViewTextEditingControllers.clear();
    _AddressViewFocusNodes.clear();
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

  String? get streetValue => this.formValueMap[StreetValueKey] as String?;
  String? get buildingValue => this.formValueMap[BuildingValueKey] as String?;
  String? get cityValue => this.formValueMap[CityValueKey] as String?;
  String? get stateValue => this.formValueMap[StateValueKey] as String?;
  String? get zipCodeValue => this.formValueMap[ZipCodeValueKey] as String?;

  set streetValue(String? value) {
    this.setData(
      this.formValueMap..addAll({StreetValueKey: value}),
    );

    if (_AddressViewTextEditingControllers.containsKey(StreetValueKey)) {
      _AddressViewTextEditingControllers[StreetValueKey]?.text = value ?? '';
    }
  }

  set buildingValue(String? value) {
    this.setData(
      this.formValueMap..addAll({BuildingValueKey: value}),
    );

    if (_AddressViewTextEditingControllers.containsKey(BuildingValueKey)) {
      _AddressViewTextEditingControllers[BuildingValueKey]?.text = value ?? '';
    }
  }

  set cityValue(String? value) {
    this.setData(
      this.formValueMap..addAll({CityValueKey: value}),
    );

    if (_AddressViewTextEditingControllers.containsKey(CityValueKey)) {
      _AddressViewTextEditingControllers[CityValueKey]?.text = value ?? '';
    }
  }

  set stateValue(String? value) {
    this.setData(
      this.formValueMap..addAll({StateValueKey: value}),
    );

    if (_AddressViewTextEditingControllers.containsKey(StateValueKey)) {
      _AddressViewTextEditingControllers[StateValueKey]?.text = value ?? '';
    }
  }

  set zipCodeValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ZipCodeValueKey: value}),
    );

    if (_AddressViewTextEditingControllers.containsKey(ZipCodeValueKey)) {
      _AddressViewTextEditingControllers[ZipCodeValueKey]?.text = value ?? '';
    }
  }

  bool get hasStreet =>
      this.formValueMap.containsKey(StreetValueKey) &&
      (streetValue?.isNotEmpty ?? false);
  bool get hasBuilding =>
      this.formValueMap.containsKey(BuildingValueKey) &&
      (buildingValue?.isNotEmpty ?? false);
  bool get hasCity =>
      this.formValueMap.containsKey(CityValueKey) &&
      (cityValue?.isNotEmpty ?? false);
  bool get hasState =>
      this.formValueMap.containsKey(StateValueKey) &&
      (stateValue?.isNotEmpty ?? false);
  bool get hasZipCode =>
      this.formValueMap.containsKey(ZipCodeValueKey) &&
      (zipCodeValue?.isNotEmpty ?? false);

  bool get hasStreetValidationMessage =>
      this.fieldsValidationMessages[StreetValueKey]?.isNotEmpty ?? false;
  bool get hasBuildingValidationMessage =>
      this.fieldsValidationMessages[BuildingValueKey]?.isNotEmpty ?? false;
  bool get hasCityValidationMessage =>
      this.fieldsValidationMessages[CityValueKey]?.isNotEmpty ?? false;
  bool get hasStateValidationMessage =>
      this.fieldsValidationMessages[StateValueKey]?.isNotEmpty ?? false;
  bool get hasZipCodeValidationMessage =>
      this.fieldsValidationMessages[ZipCodeValueKey]?.isNotEmpty ?? false;

  String? get streetValidationMessage =>
      this.fieldsValidationMessages[StreetValueKey];
  String? get buildingValidationMessage =>
      this.fieldsValidationMessages[BuildingValueKey];
  String? get cityValidationMessage =>
      this.fieldsValidationMessages[CityValueKey];
  String? get stateValidationMessage =>
      this.fieldsValidationMessages[StateValueKey];
  String? get zipCodeValidationMessage =>
      this.fieldsValidationMessages[ZipCodeValueKey];
}

extension Methods on FormStateHelper {
  setStreetValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[StreetValueKey] = validationMessage;
  setBuildingValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[BuildingValueKey] = validationMessage;
  setCityValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CityValueKey] = validationMessage;
  setStateValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[StateValueKey] = validationMessage;
  setZipCodeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ZipCodeValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    streetValue = '';
    buildingValue = '';
    cityValue = '';
    stateValue = '';
    zipCodeValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      StreetValueKey: getValidationMessage(StreetValueKey),
      BuildingValueKey: getValidationMessage(BuildingValueKey),
      CityValueKey: getValidationMessage(CityValueKey),
      StateValueKey: getValidationMessage(StateValueKey),
      ZipCodeValueKey: getValidationMessage(ZipCodeValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _AddressViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _AddressViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      StreetValueKey: getValidationMessage(StreetValueKey),
      BuildingValueKey: getValidationMessage(BuildingValueKey),
      CityValueKey: getValidationMessage(CityValueKey),
      StateValueKey: getValidationMessage(StateValueKey),
      ZipCodeValueKey: getValidationMessage(ZipCodeValueKey),
    });
