import 'package:freezed_annotation/freezed_annotation.dart';
part 'employee.freezed.dart';
part 'employee.g.dart';

@freezed
class Employee with _$Employee {
  const factory Employee({
    required String name,
    required Role role,
    required DateTime startDate,
    @JsonKey(includeIfNull: false) DateTime? endDate,
  }) = _Employee;

  factory Employee.fromJson(Map<String, Object?> json) =>
      _$EmployeeFromJson(json);
}

enum Role {
  @JsonValue('PRODUCT_DESIGNER')
  productDesigner,
  @JsonValue('FLUTTER_DEVELOPER')
  flutterDeveloper,
  @JsonValue('QA_TESTER')
  qaTester,
  @JsonValue('PRODUCT_OWNER')
  productOwner
}
