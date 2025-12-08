import 'package:employee_management/features/employee/domain/entity/employee_entity.dart';
import 'package:employee_management/features/employee/domain/repository/employee_repository.dart';

class GetEmployeeByIdUseCase {
  final EmployeeRepository repository;
  GetEmployeeByIdUseCase(this.repository);

  Future<EmployeeEntity> call(int id) => repository.getEmployeeById(id);
}
