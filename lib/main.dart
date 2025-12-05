import 'package:employee_management/features/employee/presentation/screens/employee_home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EmployeeManagement());
}

class EmployeeManagement extends StatelessWidget {
  const EmployeeManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmployeeHomeScreen(),
    );
  }
}
