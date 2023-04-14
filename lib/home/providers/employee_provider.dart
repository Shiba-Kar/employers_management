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
    var emp = await _storageServices.getEmployees();
    state = emp;
  }

  Future updateEmployee(Employee emp) async {
    await _storageServices.updateEmployee(emp);
    state = await _storageServices.getEmployees();
  }

  Future addEmployee(Employee emp) async {
    await _storageServices.addEmployee(emp);
    state = [emp, ...state];
    //state = [...state, emp];
  }

  removeEmployee(Employee emp) async {
    state =
        state.where((e) => e.empID != emp.empID).toList(); //.reversed.toList();
    await _storageServices.removeEmployee(emp);
  }
}

final employeeProvider =
    StateNotifierProvider<EmployeeProvider, List<Employee>>(
        (_) => EmployeeProvider());
