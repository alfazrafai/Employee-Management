import 'package:flutter/material.dart';

import '../constant/app_color.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType inputType;
  final String? Function(String?)? validator;
  final bool isPassword;
  final int? maxLength;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.inputType = TextInputType.text,
    this.validator,
    this.isPassword = false,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.primary,
      keyboardType: inputType,
      obscureText: isPassword,
      maxLength: maxLength,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return "$hint can't be empty";
            }
            return null;
          },
      decoration: InputDecoration(
        hintText: hint,
        counterText: "",
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: AppColors.primary, width: 1.8),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.red, width: 1.2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.red, width: 1.8),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
