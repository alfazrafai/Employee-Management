import 'package:employee_management/features/employee/domain/entity/employee_entity.dart';
import 'package:employee_management/features/employee/domain/repository/employee_repository.dart';

class GetAllEmployeeUseCase {
  final EmployeeRepository repository;

  GetAllEmployeeUseCase(this.repository);

  Future<List<EmployeeEntity>> call() => repository.getEmployees();
}
