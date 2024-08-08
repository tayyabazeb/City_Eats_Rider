import 'package:flutter/services.dart';
import 'package:rider/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'custom_text_field_model.dart';

class CustomTextField extends StackedView<CustomTextFieldModel> {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final Widget? prefix;
  final Widget? suffix;
  final FocusNode? focusNode;
  final BoxConstraints? prefixConstraints;
  final BoxConstraints? suffixConstraints;
  final int? maxLines;
  final bool? obscure;
  final String? errorText;
  final double? borderRadius;
  final bool? enabled;
  final bool? autofocus;
  final double? fontSize;
  final String? label;
  final int? maxLength;
  final void Function(String?)? onSaved;
  final VoidCallback? onTap;
  final bool disableBorder;
  final void Function(String?)? onChanged;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final Color? fillColor;
  final Color? focusColor;
  final bool readOnly;
  final bool? noSpace;

  const CustomTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.onEditingComplete,
    this.focusNode,
    this.textInputType,
    this.noSpace = false,
    this.obscure = false,
    this.enabled = true,
    this.validator,
    this.prefix,
    this.suffix,
    this.prefixConstraints,
    this.suffixConstraints,
    this.borderRadius = 8,
    this.maxLines = 1,
    this.errorText,
    this.fontSize = 14.0,
    this.label,
    this.maxLength,
    this.onSaved,
    this.onTap,
    this.disableBorder = false,
    this.autofocus = false,
    this.onChanged,
    this.textInputAction,
    this.textCapitalization,
    this.onFieldSubmitted,
    this.fillColor = kcWhitColor,
    this.focusColor = kcWhitColor,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget builder(
      BuildContext context, CustomTextFieldModel viewModel, Widget? child) {
    return TextFormField(
      onEditingComplete: onEditingComplete,
      readOnly: readOnly,
      focusNode: focusNode,
      onChanged: onChanged,
      onTap: onTap,
      onSaved: onSaved,
      cursorColor: kcGreyColor,
      enabled: enabled,
      autofocus: autofocus ?? false,
      textInputAction: textInputAction ?? TextInputAction.next,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      maxLines: maxLines,
      inputFormatters: (noSpace ?? false) ? [NoSpaceFormatter()] : null,
      keyboardType: textInputType,
      obscureText: obscure ?? false,
      enableSuggestions: !(obscure ?? false),
      autocorrect: !(obscure ?? false),
      maxLength: maxLength ?? 150,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        labelText: label,
        fillColor: fillColor,
        filled: true,
        counter: const Offstage(),
        prefixIconConstraints: prefixConstraints,
        prefixIcon: prefix != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: prefix!,
              )
            : null,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        hintText: hintText,
      ),
      validator: validator ??
          (value) {
            if (value != null) {
              return errorText;
            } else {
              return null;
            }
          },
    );
  }

  @override
  CustomTextFieldModel viewModelBuilder(BuildContext context) =>
      CustomTextFieldModel();
}

//inputFormatters: (noSpace ?? false) ? [NoSpaceFormatter()] : null,
class NoSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // If the new value contains any space, reject the change
    if (newValue.text.contains(' ')) {
      // You can also show a message or perform any action here to notify the user
      return oldValue;
    }
    // Otherwise, allow the change
    return newValue;
  }
}
