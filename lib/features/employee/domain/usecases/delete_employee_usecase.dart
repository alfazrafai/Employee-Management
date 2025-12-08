import 'package:employee_management/features/employee/domain/repository/employee_repository.dart';

class DeleteEmployeeUseCase {
  final EmployeeRepository repository;

  DeleteEmployeeUseCase(this.repository);

  Future<void> call(int id) => repository.deleteEmployee(id);
}
