import 'package:employee_management/features/employee/domain/entity/employee_entity.dart';

abstract class EmployeeRepository {
  Future<List<EmployeeEntity>> getEmployees();

  Future<EmployeeEntity> getEmployeeById(int id);

  Future<EmployeeEntity> createEmployee(EmployeeEntity employee);

  Future<void> updateEmployee(int id, EmployeeEntity employee);

  Future<void> deleteEmployee(int id);
}
