import 'package:employee_management/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/aa_textfield.dart';
import '../../../../core/widget/app_button.dart';
import '../../../../core/widget/app_profile_image.dart';
import '../../domain/entity/employee_entity.dart';
import '../cubit/employee_cubit.dart';

class AddEmployeeScreen extends StatelessWidget {
  AddEmployeeScreen({super.key});

  final nameCtrl = TextEditingController();
  final salaryCtrl = TextEditingController();
  final ageCtrl = TextEditingController();
  final idCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 70),
                ProfileImage(),
                SizedBox(height: 20),
                CustomTextField(
                  inputType: .number,
                  controller: idCtrl,
                  hint: "Employee ID",
                ),
                SizedBox(height: 10),
                CustomTextField(
                  inputType: .name,
                  controller: nameCtrl,
                  hint: "Employee Name",
                ),
                SizedBox(height: 10),
                CustomTextField(
                  inputType: .number,
                  controller: salaryCtrl,
                  hint: "Employee Salary",
                ),
                SizedBox(height: 10),
                CustomTextField(
                  inputType: .number,
                  controller: ageCtrl,
                  hint: "Employee Age",
                ),
                SizedBox(height: 40),
                AppButton(
                  width: 200,
                  title: 'Save',
                  backGroundColor: AppColors.primary,
                  onTap: () {
                    final employee = EmployeeEntity(
                      id: int.parse(idCtrl.text),
                      employeeName: nameCtrl.text,
                      employeeSalary: salaryCtrl.text,
                      employeeAge: ageCtrl.text,
                    );

                    context.read<EmployeeCubit>().addEmployee(employee);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
