import 'package:employee_management/core/constant/app_color.dart';
import 'package:employee_management/features/employee/presentation/cubit/employee_cubit.dart';
import 'package:employee_management/features/employee/presentation/screens/employee_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_employee_screen.dart';

class EmployeeHomeScreen extends StatefulWidget {
  const EmployeeHomeScreen({super.key});

  @override
  State<EmployeeHomeScreen> createState() => _EmployeeHomeScreenState();
}

class _EmployeeHomeScreenState extends State<EmployeeHomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<EmployeeCubit>().fetchEmployee();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'search employee..',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<EmployeeCubit, EmployeeState>(
                  builder: (context, state) {
                    if (state is EmployeeLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is EmployeeLoaded) {
                      final employees = state.employees;

                      return ListView.builder(
                        itemCount: employees.length,
                        itemBuilder: (_, index) {
                          final emp = employees[index];
                          return Card(
                            elevation: 3,
                            margin: EdgeInsets.symmetric(vertical: 8),
                            color: AppColors.textWhite,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Text(emp.employeeName[0]),
                              ),
                              title: Text(emp.employeeName),
                              subtitle: Text(
                                "Age: ${emp.employeeAge} • Salary: ${emp.employeeSalary}",
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        EmployeeDetailScreen(id: emp.id),
                                  ),
                                ).then((_) {
                                  context.read<EmployeeCubit>().emit(
                                    EmployeeLoaded(
                                      context.read<EmployeeCubit>().employees,
                                    ),
                                  );
                                });
                              },
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: AppColors.primaryRed,
                                ),
                                onPressed: () {
                                  context.read<EmployeeCubit>().deleteEmployee(
                                    emp.id,
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Center(child: Text("No employees found"));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AddEmployeeScreen()),
            ).then((_) {
              context.read<EmployeeCubit>().emit(
                EmployeeLoaded(context.read<EmployeeCubit>().employees),
              );
            }),
        child: Text("Add"),
      ),
    );
  }
}
