import 'package:flutter/material.dart';

import '../constant/app_color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        hintText: "Employee name",
        hintStyle: TextStyle(color: AppColors.textGrey, fontSize: 14),

        // Add spacing inside the input
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),

        // Normal border
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.2),
        ),

        // Border when focused
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: AppColors.primary, // your blue or primary color
            width: 1.8,
          ),
        ),

        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
