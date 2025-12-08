import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:employee_management/core/constant/app_color.dart';
import 'package:employee_management/core/widget/aa_textfield.dart';
import 'package:employee_management/core/widget/app_button.dart';
import 'package:employee_management/core/widget/app_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/employee_entity.dart';
import '../cubit/employee_cubit.dart';

class EmployeeDetailScreen extends StatefulWidget {
  final int id;
  const EmployeeDetailScreen({super.key, required this.id});

  @override
  State<EmployeeDetailScreen> createState() => _EmployeeDetailScreenState();
}

class _EmployeeDetailScreenState extends State<EmployeeDetailScreen> {
  final nameCtrl = TextEditingController();
  final salaryCtrl = TextEditingController();
  final ageCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<EmployeeCubit>().fetchEmployeeDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<EmployeeCubit, EmployeeState>(
        builder: (context, state) {
          if (state is EmployeeDetailLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is EmployeeDetailLoaded) {
            final emp = state.employee;

            nameCtrl.text = emp.employeeName;
            salaryCtrl.text = emp.employeeSalary;
            ageCtrl.text = emp.employeeAge;

            return SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      SizedBox(height: 100),
                      ProfileImage(),
                      SizedBox(height: 20),
                      Text(
                        emp.employeeName,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Age: ${emp.employeeAge}",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      CustomTextField(
                        controller: nameCtrl,
                        hint: "Employee Name",
                      ),
                      SizedBox(height: 20),
                      CustomTextField(
                        controller: salaryCtrl,
                        hint: "Employee Salary",
                      ),
                      SizedBox(height: 20),
                      CustomTextField(
                        controller: ageCtrl,
                        hint: "Employee Age",
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppButton(
                            title: 'Edit',
                            width: 150,
                            backGroundColor: AppColors.primary,
                            onTap: () {
                              final updated = EmployeeEntity(
                                id: emp.id,
                                employeeName: nameCtrl.text,
                                employeeSalary: salaryCtrl.text,
                                employeeAge: ageCtrl.text,
                              );
                              context.read<EmployeeCubit>().updateEmployee(
                                emp.id,
                                updated,
                              );
                              Navigator.pop(context);
                            },
                          ),
                          AppButton(
                            title: 'Delete',
                            width: 150,
                            backGroundColor: AppColors.primaryRed,
                            onTap: () {
                              context.read<EmployeeCubit>().deleteEmployee(
                                emp.id,
                              );
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Center(child: Text("Error loading employee"));
        },
      ),
    );
  }
}
