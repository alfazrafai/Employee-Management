import '../../domain/entity/employee_entity.dart';

class EmployeeModel extends EmployeeEntity {
  EmployeeModel({
    required super.id,
    required super.employeeName,
    required super.employeeSalary,
    required super.employeeAge,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
    id: json["id"],
    employeeName: json["employee_name"],
    employeeSalary: json["employee_salary"].toString(),
    employeeAge: json["employee_age"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "name": employeeName,
    "salary": employeeSalary,
    "age": employeeAge,
  };
}
