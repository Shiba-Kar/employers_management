// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Employee _$EmployeeFromJson(Map<String, dynamic> json) {
  return _Employee.fromJson(json);
}

/// @nodoc
mixin _$Employee {
  @JsonKey(name: "emp_id", includeIfNull: false)
  @HiveField(0)
  int? get empID => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  Role get role => throw _privateConstructorUsedError;
  @JsonKey(name: "start_date", includeIfNull: false)
  @HiveField(3)
  DateTime get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: "end_date", includeIfNull: false)
  @HiveField(4)
  DateTime? get endDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeeCopyWith<Employee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeCopyWith<$Res> {
  factory $EmployeeCopyWith(Employee value, $Res Function(Employee) then) =
      _$EmployeeCopyWithImpl<$Res, Employee>;
  @useResult
  $Res call(
      {@JsonKey(name: "emp_id", includeIfNull: false)
      @HiveField(0)
          int? empID,
      @HiveField(1)
          String name,
      @HiveField(2)
          Role role,
      @JsonKey(name: "start_date", includeIfNull: false)
      @HiveField(3)
          DateTime startDate,
      @JsonKey(name: "end_date", includeIfNull: false)
      @HiveField(4)
          DateTime? endDate});
}

/// @nodoc
class _$EmployeeCopyWithImpl<$Res, $Val extends Employee>
    implements $EmployeeCopyWith<$Res> {
  _$EmployeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? empID = freezed,
    Object? name = null,
    Object? role = null,
    Object? startDate = null,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      empID: freezed == empID
          ? _value.empID
          : empID // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmployeeCopyWith<$Res> implements $EmployeeCopyWith<$Res> {
  factory _$$_EmployeeCopyWith(
          _$_Employee value, $Res Function(_$_Employee) then) =
      __$$_EmployeeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "emp_id", includeIfNull: false)
      @HiveField(0)
          int? empID,
      @HiveField(1)
          String name,
      @HiveField(2)
          Role role,
      @JsonKey(name: "start_date", includeIfNull: false)
      @HiveField(3)
          DateTime startDate,
      @JsonKey(name: "end_date", includeIfNull: false)
      @HiveField(4)
          DateTime? endDate});
}

/// @nodoc
class __$$_EmployeeCopyWithImpl<$Res>
    extends _$EmployeeCopyWithImpl<$Res, _$_Employee>
    implements _$$_EmployeeCopyWith<$Res> {
  __$$_EmployeeCopyWithImpl(
      _$_Employee _value, $Res Function(_$_Employee) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? empID = freezed,
    Object? name = null,
    Object? role = null,
    Object? startDate = null,
    Object? endDate = freezed,
  }) {
    return _then(_$_Employee(
      empID: freezed == empID
          ? _value.empID
          : empID // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0, adapterName: "EmployeeType")
class _$_Employee implements _Employee {
  const _$_Employee(
      {@JsonKey(name: "emp_id", includeIfNull: false)
      @HiveField(0)
          this.empID,
      @HiveField(1)
          required this.name,
      @HiveField(2)
          required this.role,
      @JsonKey(name: "start_date", includeIfNull: false)
      @HiveField(3)
          required this.startDate,
      @JsonKey(name: "end_date", includeIfNull: false)
      @HiveField(4)
          this.endDate});

  factory _$_Employee.fromJson(Map<String, dynamic> json) =>
      _$$_EmployeeFromJson(json);

  @override
  @JsonKey(name: "emp_id", includeIfNull: false)
  @HiveField(0)
  final int? empID;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final Role role;
  @override
  @JsonKey(name: "start_date", includeIfNull: false)
  @HiveField(3)
  final DateTime startDate;
  @override
  @JsonKey(name: "end_date", includeIfNull: false)
  @HiveField(4)
  final DateTime? endDate;

  @override
  String toString() {
    return 'Employee(empID: $empID, name: $name, role: $role, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Employee &&
            (identical(other.empID, empID) || other.empID == empID) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, empID, name, role, startDate, endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmployeeCopyWith<_$_Employee> get copyWith =>
      __$$_EmployeeCopyWithImpl<_$_Employee>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmployeeToJson(
      this,
    );
  }
}

abstract class _Employee implements Employee {
  const factory _Employee(
      {@JsonKey(name: "emp_id", includeIfNull: false)
      @HiveField(0)
          final int? empID,
      @HiveField(1)
          required final String name,
      @HiveField(2)
          required final Role role,
      @JsonKey(name: "start_date", includeIfNull: false)
      @HiveField(3)
          required final DateTime startDate,
      @JsonKey(name: "end_date", includeIfNull: false)
      @HiveField(4)
          final DateTime? endDate}) = _$_Employee;

  factory _Employee.fromJson(Map<String, dynamic> json) = _$_Employee.fromJson;

  @override
  @JsonKey(name: "emp_id", includeIfNull: false)
  @HiveField(0)
  int? get empID;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  Role get role;
  @override
  @JsonKey(name: "start_date", includeIfNull: false)
  @HiveField(3)
  DateTime get startDate;
  @override
  @JsonKey(name: "end_date", includeIfNull: false)
  @HiveField(4)
  DateTime? get endDate;
  @override
  @JsonKey(ignore: true)
  _$$_EmployeeCopyWith<_$_Employee> get copyWith =>
      throw _privateConstructorUsedError;
}
