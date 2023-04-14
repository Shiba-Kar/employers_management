import 'package:employers_management/home/models/models.dart';
import 'package:hive/hive.dart';

class StorageServices {
  late Box<List<Employee>> _box;
  StorageServices() {
    _box = Hive.box("employees_box");
  }

  Future<List<Employee>> getEmployees() async {
    return _box.get('employees') ?? [];
  }

  Future addEmployee(Employee emp) async {
    var temp = await getEmployees();
    temp.add(emp);
    _box.add(temp);
  }

  Future removeEmployee(Employee emp) async {
    var temp = await getEmployees();
    temp.remove(emp);
    _box.add(temp);
  }
}
