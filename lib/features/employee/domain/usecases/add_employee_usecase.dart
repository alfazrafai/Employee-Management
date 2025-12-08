import 'package:employee_management/features/employee/domain/entity/employee_entity.dart';
import 'package:employee_management/features/employee/domain/repository/employee_repository.dart';

class AddEmployeeUseCase {
  final EmployeeRepository repository;

  AddEmployeeUseCase(this.repository);

  Future<EmployeeEntity> call(EmployeeEntity employee) {
    return repository.createEmployee(employee);
  }
}
