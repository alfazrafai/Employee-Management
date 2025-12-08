import 'package:employee_management/features/employee/data/datasource/employee_remote_data_source.dart';
import 'package:employee_management/features/employee/data/repository/employee_repository_impl.dart';
import 'package:employee_management/features/employee/domain/usecases/add_employee_usecase.dart';
import 'package:employee_management/features/employee/domain/usecases/delete_employee_usecase.dart';
import 'package:employee_management/features/employee/domain/usecases/get_all_employee_usecase.dart';
import 'package:employee_management/features/employee/domain/usecases/get_employee_by_id_usecase.dart';
import 'package:employee_management/features/employee/domain/usecases/update_employee_usecase.dart';
import 'package:employee_management/features/employee/presentation/cubit/employee_cubit.dart';
import 'package:employee_management/features/employee/presentation/screens/employee_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final dataSource = EmployeeRemoteDataSource();
  final repo = EmployeeRepositoryImpl(dataSource);

  runApp(
    BlocProvider(
      create: (_) => EmployeeCubit(
        addEmployeeUseCase: AddEmployeeUseCase(repo),
        updateEmployeeUseCase: UpdateEmployeeUseCase(repo),
        deleteEmployeeUseCase: DeleteEmployeeUseCase(repo),
        getAllEmployeeUseCase: GetAllEmployeeUseCase(repo),
        getEmployeeByIdUseCase: GetEmployeeByIdUseCase(repo),
      )..fetchEmployee(),
      child: EmployeeManagement(),
    ),
  );
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
