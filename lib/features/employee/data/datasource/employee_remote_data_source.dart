import 'package:dio/dio.dart';
import 'package:employee_management/core/constant/api_endpoints.dart';
import 'package:employee_management/features/employee/data/model/employee_model.dart';
import 'logging.dart';

class EmployeeRemoteDataSource {
  late final Dio dio;

  EmployeeRemoteDataSource() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        validateStatus: (status) => status! < 500,
      ),
    );
    dio.interceptors.add(DioLogger());
  }

  Future<List<EmployeeModel>> getAllEmployees() async {
    final response = await dio.get(ApiEndpoints.allEmployee);
    final List employeeList = response.data["data"];
    return employeeList.map((e) => EmployeeModel.fromJson(e)).toList();
  }

  Future<EmployeeModel> getEmployeeById(int id) async {
    final response = await dio.get("${ApiEndpoints.employee}/$id");
    final data = response.data["data"];
    return EmployeeModel.fromJson(data);
  }

  // Future<void> createUser(EmployeeModel model) async {
  //   await dio.post(ApiEndpoints.create, data: model.toJson());
  // }

  Future<EmployeeModel> createUser(EmployeeModel model) async {
    final response = await dio.post(ApiEndpoints.create, data: model.toJson());
    return EmployeeModel.fromJson(response.data["data"]);
  }

  Future<void> updateEmployee(int id, EmployeeModel model) async {
    await dio.put("${ApiEndpoints.update}/$id", data: model.toJson());
  }

  Future<void> delete(int id) async {
    await dio.delete("${ApiEndpoints.delete}/$id");
  }
}
