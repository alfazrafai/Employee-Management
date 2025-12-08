part of 'employee_cubit.dart';

abstract class EmployeeState {}

class EmployeeInitial extends EmployeeState {}

class EmployeeLoading extends EmployeeState {}

class EmployeeLoaded extends EmployeeState {
  final List<EmployeeEntity> employee;

  EmployeeLoaded(this.employee);
}

class EmployeeDetailLoaded extends EmployeeState {
  final EmployeeEntity employeeEntity;

  EmployeeDetailLoaded(this.employeeEntity);
}

class EmployeeDetailLoading extends EmployeeState {}

class EmployeeError extends EmployeeState {
  final String message;

  EmployeeError(this.message);
}
