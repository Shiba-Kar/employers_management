import 'package:employers_management/home/models/models.dart';
import 'package:employers_management/home/services/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmployeeProvider extends StateNotifier<List<Employee>> {
  late StorageServices _storageServices;
  EmployeeProvider() : super([]) {
    _loadEmployeesFromStorage();
  }

  _loadEmployeesFromStorage() async {
    _storageServices = StorageServices();
    state = await _storageServices.getEmployees();
  }

  addEmployee(Employee emp) async {
    await _storageServices.addEmployee(emp);
    state = [...state, emp];
  }

  removeEmployee(Employee emp) async {
    await _storageServices.removeEmployee(emp);
    state = state.where((e) => e.name != emp.name).toList();
  }
}

final employeeProvider =
    StateNotifierProvider<EmployeeProvider, List<Employee>>(
        (_) => EmployeeProvider());
