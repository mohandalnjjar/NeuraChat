import 'package:flutter/material.dart';
import 'package:neura_chat/core/constants/app_palette.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.hint,
    this.prefixIcon,
    this.keyBordType,
    this.onSaved,
    this.validator,
    this.controller,
    this.onFieldSubmitted,
    this.focusNode,
    this.onChanged,
    this.suffixIcon,
    this.obscureText = false,
    this.hintStyle,
    this.maxLines = 1,
    this.initialValue,
  });
  final int maxLines;
  final String hint;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  final void Function(String)? onChanged;
  final TextInputType? keyBordType;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      maxLines: maxLines,
      obscureText: obscureText,
      onChanged: onChanged,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      keyboardType: keyBordType,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        contentPadding: const EdgeInsets.all(17),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hint,
        hintStyle: hintStyle,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(27),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppPalette.kPrimaryColor,
          ),
          borderRadius: BorderRadius.circular(27),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(27),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(27),
        ),
      ),
    );
  }
}
