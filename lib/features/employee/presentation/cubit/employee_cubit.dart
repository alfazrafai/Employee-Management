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

  List<EmployeeEntity> employees = [];

  Future<void> fetchEmployee() async {
    emit(EmployeeLoading());
    try {
      employees = await getAllEmployeeUseCase();
      emit(EmployeeLoaded(employees));
    } catch (_) {
      emit(EmployeeError("Something went wrong"));
    }
  }

  Future<void> fetchEmployeeDetail(int id) async {
    emit(EmployeeDetailLoading());
    try {
      final result = await getEmployeeByIdUseCase(id);
      emit(EmployeeDetailLoaded(result));
    } catch (_) {
      emit(EmployeeError("Failed to load employee detail"));
    }
  }

  Future<void> addEmployee(EmployeeEntity emp) async {
    final created = await addEmployeeUseCase(emp);
    employees.add(created);
    emit(EmployeeLoaded(employees));
  }

  Future<void> updateEmployee(int id, EmployeeEntity emp) async {
    await updateEmployeeUseCase(id, emp);
    final index = employees.indexWhere((e) => e.id == id);
    employees[index] = emp;
    emit(EmployeeLoaded(employees));
  }

  Future<void> deleteEmployee(int id) async {
    await deleteEmployeeUseCase(id);
    employees.removeWhere((e) => e.id == id);
    emit(EmployeeLoaded(employees));
  }
}
