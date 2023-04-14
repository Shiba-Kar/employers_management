// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Employee _$$_EmployeeFromJson(Map<String, dynamic> json) => _$_Employee(
      name: json['name'] as String,
      role: $enumDecode(_$RoleEnumMap, json['role']),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
    );

Map<String, dynamic> _$$_EmployeeToJson(_$_Employee instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'role': _$RoleEnumMap[instance.role]!,
    'startDate': instance.startDate.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('endDate', instance.endDate?.toIso8601String());
  return val;
}

const _$RoleEnumMap = {
  Role.productDesigner: 'PRODUCT_DESIGNER',
  Role.flutterDeveloper: 'FLUTTER_DEVELOPER',
  Role.qaTester: 'QA_TESTER',
  Role.productOwner: 'PRODUCT_OWNER',
};
