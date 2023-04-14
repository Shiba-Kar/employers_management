import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'employee.freezed.dart';
part 'employee.g.dart';

@freezed
class Employee with _$Employee {
  @HiveType(typeId: 0, adapterName: "EmployeeType")
  const factory Employee({
    @JsonKey(name: "emp_id", includeIfNull: false) @HiveField(0) int? empID,
    @HiveField(1) required String name,
    @HiveField(2) required Role role,
    @JsonKey(name: "start_date", includeIfNull: false)
    @HiveField(3)
        required DateTime startDate,
    @JsonKey(name: "end_date", includeIfNull: false)
    @HiveField(4)
        DateTime? endDate,
  }) = _Employee;

  factory Employee.fromJson(Map<String, Object?> json) =>
      _$EmployeeFromJson(json);
}

@HiveType(typeId: 1, adapterName: "RoleType")
enum Role {
  @JsonValue('PRODUCT_DESIGNER')
  @HiveField(0, defaultValue: 'Product_Designer')
  Product_Designer,
  @JsonValue('FLUTTER_DEVELOPER')
  @HiveField(1, defaultValue: 'Flutter_Developer')
  Flutter_Developer,
  @JsonValue('QA_TESTER')
  @HiveField(2, defaultValue: "QA_Tester")
  QA_Tester,
  @JsonValue('PRODUCT_OWNER')
  @HiveField(3, defaultValue: 'Product_Owner')
  Product_Owner
}
