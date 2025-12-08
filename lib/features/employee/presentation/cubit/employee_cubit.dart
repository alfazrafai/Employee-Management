import 'package:bloc/bloc.dart';
import 'package:employee_management/features/employee/domain/entity/employee_entity.dart';
import 'package:employee_management/features/employee/domain/usecases/add_employee_usecase.dart';
import 'package:employee_management/features/employee/domain/usecases/delete_employee_usecase.dart';
import 'package:employee_management/features/employee/domain/usecases/get_all_employee_usecase.dart';
import 'package:employee_management/features/employee/domain/usecases/get_employee_by_id_usecase.dart';
import 'package:employee_management/features/employee/domain/usecases/update_employee_usecase.dart';

part 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit({
    required this.getAllEmployeeUseCase,
    required this.getEmployeeByIdUseCase,
    required this.addEmployeeUseCase,
    required this.updateEmployeeUseCase,
    required this.deleteEmployeeUseCase,
  }) : super(EmployeeInitial());

  final GetAllEmployeeUseCase getAllEmployeeUseCase;
  final GetEmployeeByIdUseCase getEmployeeByIdUseCase;
  final AddEmployeeUseCase addEmployeeUseCase;
  final UpdateEmployeeUseCase updateEmployeeUseCase;
  final DeleteEmployeeUseCase deleteEmployeeUseCase;

  List<EmployeeEntity> employee = [];

  Future<void> fetchEmployee() async {
    emit(EmployeeLoading());
    try {
      employee = await getAllEmployeeUseCase();
      emit(EmployeeLoaded(employee));
    } catch (e) {
      emit(EmployeeError("Something went to wrong"));
    }
  }

  Future<void> fetchEmployeeDetail(int id) async {
    emit(EmployeeDetailLoading());
    try {
      final result = await getEmployeeByIdUseCase(id);
      emit(EmployeeDetailLoaded(result));
    } catch (e) {
      emit(EmployeeError("Failed to load employee detail"));
    }
  }

  Future<void> addEmployee(EmployeeEntity employee) async {
    await addEmployeeUseCase(employee);
    fetchEmployee();
  }

  Future<void> updateEmployee(int id, EmployeeEntity employee) async {
    await updateEmployeeUseCase(id, employee);
    fetchEmployee();
  }

  Future<void> deleteEmployee(int id) async {
    await deleteEmployeeUseCase(id);
    fetchEmployee();
  }
}
