import 'package:flutter/material.dart';

import '../../../../core/widget/aa_textfield.dart';
import '../../../../core/widget/app_button.dart';
import '../../../../core/widget/app_profile_image.dart';

class AddEmployeeScreen extends StatelessWidget {
  const AddEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const .all(20),
          child: Column(
            crossAxisAlignment: .center,
            children: [
              SizedBox(height: 100),
              ProfileImage(),
              SizedBox(height: 20),
              Form(
                child: Column(
                  children: [
                    CustomTextField(),
                    SizedBox(height: 10),
                    CustomTextField(),
                    SizedBox(height: 10),
                    CustomTextField(),
                    SizedBox(height: 10),
                    CustomTextField(),
                  ],
                ),
              ),
              SizedBox(height: 40),

              AppButton(),
            ],
          ),
        ),
      ),
    );
  }
}
