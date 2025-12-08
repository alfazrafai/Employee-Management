import 'package:dio/dio.dart';
import 'package:employee_management/core/constant/api_endpoints.dart';
import 'package:employee_management/features/employee/data/model/employee_model.dart';

class EmployeeRemoteDataSource {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl));

  Future<List<EmployeeModel>> getAllEmployees() async {
    final response = await dio.get(ApiEndpoints.allEmployee);
    final List employeeList = response.data["data"];
    return employeeList.map((e) => EmployeeModel.fromJson(e)).toList();
  }

  Future<EmployeeModel> getEmployeeById(int id) async {
    final response = await dio.get("${ApiEndpoints.employee}/$id}");
    final data = response.data["data"];
    return EmployeeModel.fromJson(data);
  }

  Future<void> createUser(EmployeeModel model) async {
    await dio.post(ApiEndpoints.create, data: model.toJson());
  }

  Future<void> updateEmployee(int id, EmployeeModel model) async {
    await dio.put("${ApiEndpoints.update}/$id", data: model.toJson());
  }

  Future<void> delete(int id) async {
    await dio.delete("${ApiEndpoints.delete}/$id");
  }
}
