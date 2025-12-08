part of 'employee_cubit.dart';

abstract class EmployeeState {}

class EmployeeInitial extends EmployeeState {}

class EmployeeLoading extends EmployeeState {}

class EmployeeLoaded extends EmployeeState {
  final List<EmployeeEntity> employees;
  EmployeeLoaded(this.employees);
}

class EmployeeDetailLoading extends EmployeeState {}

class EmployeeDetailLoaded extends EmployeeState {
  final EmployeeEntity employee; // <-- this field must exist
  EmployeeDetailLoaded(this.employee);
}

class EmployeeError extends EmployeeState {
  final String message;
  EmployeeError(this.message);
}
