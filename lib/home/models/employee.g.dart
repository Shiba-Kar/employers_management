// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoleType extends TypeAdapter<Role> {
  @override
  final int typeId = 1;

  @override
  Role read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Role.Product_Designer;
      case 1:
        return Role.Flutter_Developer;
      case 2:
        return Role.QA_Tester;
      case 3:
        return Role.Product_Owner;
      default:
        return Role.Product_Designer;
    }
  }

  @override
  void write(BinaryWriter writer, Role obj) {
    switch (obj) {
      case Role.Product_Designer:
        writer.writeByte(0);
        break;
      case Role.Flutter_Developer:
        writer.writeByte(1);
        break;
      case Role.QA_Tester:
        writer.writeByte(2);
        break;
      case Role.Product_Owner:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoleType &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EmployeeType extends TypeAdapter<_$_Employee> {
  @override
  final int typeId = 0;

  @override
  _$_Employee read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Employee(
      empID: fields[0] as int?,
      name: fields[1] as String,
      role: fields[2] as Role,
      startDate: fields[3] as DateTime,
      endDate: fields[4] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Employee obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.empID)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.role)
      ..writeByte(3)
      ..write(obj.startDate)
      ..writeByte(4)
      ..write(obj.endDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeType &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Employee _$$_EmployeeFromJson(Map<String, dynamic> json) => _$_Employee(
      empID: json['emp_id'] as int?,
      name: json['name'] as String,
      role: $enumDecode(_$RoleEnumMap, json['role']),
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
    );

Map<String, dynamic> _$$_EmployeeToJson(_$_Employee instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('emp_id', instance.empID);
  val['name'] = instance.name;
  val['role'] = _$RoleEnumMap[instance.role]!;
  val['start_date'] = instance.startDate.toIso8601String();
  writeNotNull('end_date', instance.endDate?.toIso8601String());
  return val;
}

const _$RoleEnumMap = {
  Role.Product_Designer: 'PRODUCT_DESIGNER',
  Role.Flutter_Developer: 'FLUTTER_DEVELOPER',
  Role.QA_Tester: 'QA_TESTER',
  Role.Product_Owner: 'PRODUCT_OWNER',
};
