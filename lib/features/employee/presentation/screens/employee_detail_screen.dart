import 'package:employee_management/core/constant/app_color.dart';
import 'package:employee_management/core/widget/aa_textfield.dart';
import 'package:employee_management/core/widget/app_button.dart';
import 'package:employee_management/core/widget/app_profile_image.dart';
import 'package:flutter/material.dart';

class EmployeeDetailScreen extends StatelessWidget {
  const EmployeeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const .all(16),
            child: Column(
              children: [
                SizedBox(height: 100),
                ProfileImage(),
                SizedBox(height: 20),
                Text(
                  "Name",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(
                  "22",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                SizedBox(height: 20),
                CustomTextField(),
                SizedBox(height: 20),
                CustomTextField(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    AppButton(
                      title: 'Edit',
                      backGroundColor: AppColors.primary,
                      width: 150,
                    ),
                    SizedBox(height: 20),
                    AppButton(
                      width: 150,
                      title: 'Delete',
                      backGroundColor: AppColors.primaryRed,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
