import 'package:employee_management/features/employee/domain/entity/employee_entity.dart';
import 'package:employee_management/features/employee/domain/repository/employee_repository.dart';

class UpdateEmployeeUseCase {
  final EmployeeRepository repository;

  UpdateEmployeeUseCase(this.repository);

  Future<void> call(int id, EmployeeEntity employee) =>
      repository.updateEmployee(id, employee);
}
