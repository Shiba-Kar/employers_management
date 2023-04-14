import 'package:employers_management/home/models/models.dart';
import 'package:hive/hive.dart';

class StorageServices {
  late Box<Employee> _box;
  StorageServices() {
    _box = Hive.box("employees_box");
  }

  Future<List<Employee>> getEmployees() async {
    // await _box.clear();
    try {
      var emp = _box.values;

      return emp.map((e) => e).toList().reversed.toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future addEmployee(Employee emp) async {
    await _box.add(emp);
  }

  Future<int> _getIndex(Employee emp) async {
    var temp = await getEmployees();
    var x = temp.reversed.toList();
    return x.indexWhere((e) => e.empID == emp.empID);
  }

  Future updateEmployee(Employee emp) async {
    var index = await _getIndex(emp);
    await removeEmployee(emp);
    await _box.put(index, emp);
  }

  Future removeEmployee(Employee emp) async {
    var index = await _getIndex(emp);
    await _box.deleteAt(index);
  }
}
