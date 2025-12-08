import 'package:employee_management/features/employee/data/datasource/employee_remote_data_source.dart';
import 'package:employee_management/features/employee/data/model/employee_model.dart';
import 'package:employee_management/features/employee/domain/entity/employee_entity.dart';
import 'package:employee_management/features/employee/domain/repository/employee_repository.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final EmployeeRemoteDataSource dataSource;

  EmployeeRepositoryImpl(this.dataSource);

  @override
  Future<List<EmployeeEntity>> getEmployees() => dataSource.getAllEmployees();

  @override
  Future<EmployeeEntity> createEmployee(EmployeeEntity employee) {
    return dataSource.createUser(
      EmployeeModel(
        id: employee.id,
        employeeName: employee.employeeName,
        employeeSalary: employee.employeeSalary,
        employeeAge: employee.employeeAge,
      ),
    );
  }

  @override
  Future<void> deleteEmployee(int id) {
    return dataSource.delete(id);
  }

  @override
  Future<EmployeeEntity> getEmployeeById(int id) {
    return dataSource.getEmployeeById(id);
  }

  @override
  Future<void> updateEmployee(int id, EmployeeEntity employee) {
    return dataSource.updateEmployee(
      id,
      EmployeeModel(
        id: employee.id,
        employeeName: employee.employeeName,
        employeeSalary: employee.employeeSalary,
        employeeAge: employee.employeeAge,
      ),
    );
  }
}
