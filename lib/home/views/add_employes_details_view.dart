import 'dart:math';

import 'package:employers_management/home/providers/employee_provider.dart';
import 'package:employers_management/home/widgets/role_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import '../models/employee.dart';

class AddEmployesDetailsView extends ConsumerStatefulWidget {
  final Employee? employee;
  const AddEmployesDetailsView({super.key, this.employee});

  @override
  ConsumerState<AddEmployesDetailsView> createState() =>
      _AddEmployesDetailsViewState();
}

class _AddEmployesDetailsViewState
    extends ConsumerState<AddEmployesDetailsView> {
  final _formKey = GlobalKey<FormBuilderState>();
  DateTime? startDate;
  DateTime? endDate;
  Role role = Role.Flutter_Developer;

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() {
    final emp = widget.employee;
    if (emp != null) {
      startDate = emp.startDate;
      endDate = emp.endDate;
      role = emp.role;
    }
  }

  Future openButtomSheet() async {
    print("object");
    final res = await showModalBottomSheet<Role?>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (context) => const RoleBottomSheet(),
    );

    if (res != null) {
      role = res;
      _formKey.currentState?.fields['role']?.didChange(
        res.name.replaceFirst("_", " "),
      );
    }
  }

  openStartDateDialog() async {
    var res = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 4000)),
      lastDate: DateTime.now().add(const Duration(days: 4000)),
    );
    if (res != null) {
      startDate = res;
      String formattedDate = DateFormat('dd MMM yyyy').format(startDate!);
      _formKey.currentState?.fields['start_date']?.didChange(formattedDate);
    }
  }

  openEndDateDialog() async {
    var res = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 4000)),
      lastDate: DateTime.now().add(const Duration(days: 4000)),
    );
    if (res != null) {
      endDate = res;
      String formattedDate = DateFormat('dd MMM yyyy').format(endDate!);
      _formKey.currentState?.fields['end_date']?.didChange(formattedDate);
    }
  }

  save() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final empP = ref.read(employeeProvider.notifier);
      int randomInt = Random().nextInt(900000) + 100000;
      final Map<String, dynamic> value =
          Map.from(_formKey.currentState?.value ?? {});
      value.remove("end_date");
      value.remove("start_date");
      value.remove("role");
      var sDa = startDate ?? DateTime.now();
      final emp = Employee(
        empID: randomInt,
        name: value['name'],
        role: role,
        startDate: sDa,
        endDate: endDate,
      );
      if (widget.employee != null) {
        final emp = Employee(
          empID: widget.employee?.empID,
          name: value['name'],
          role: role,
          startDate: sDa,
          endDate: endDate,
        );
        await empP.updateEmployee(emp);
      } else {
        await empP.addEmployee(emp);
      }

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Employee Details"),
      ),
      body: FormBuilder(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormBuilderTextField(
                name: "name",
                initialValue: widget.employee?.name,
                validator: FormBuilderValidators.required(),
                decoration: const InputDecoration(
                  label: Text("Employee name"),
                  prefixIcon: Icon(Icons.person_pin),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.h),
              FormBuilderTextField(
                name: "role",
                readOnly: true,
                initialValue: widget.employee?.role.name.replaceFirst("_", " "),
                onTap: openButtomSheet,
                validator: FormBuilderValidators.required(),
                decoration: const InputDecoration(
                  label: Text("Select Role"),
                  prefixIcon: Icon(Icons.person_pin),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.arrow_downward),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FormBuilderTextField(
                        name: "start_date",
                        readOnly: true,
                        initialValue: startDate != null
                            ? DateFormat('dd MMM yyyy').format(startDate!)
                            : null,
                        valueTransformer: (value) {
                          print(value);
                          if (value == null) return null;
                          return null;
                          //return DateTime.parse(value);
                        },
                        onTap: openStartDateDialog,
                        decoration: const InputDecoration(
                          label: Text("Today"),
                          prefixIcon: Icon(Icons.calendar_month),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  const Icon(Icons.arrow_forward_sharp),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FormBuilderTextField(
                        name: "end_date",
                        initialValue: endDate != null
                            ? DateFormat('dd MMM yyyy').format(endDate!)
                            : null,
                        readOnly: true,
                        onTap: openEndDateDialog,
                        decoration: const InputDecoration(
                          label: Text("No Date"),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.calendar_month),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            //elevation: 0.0,
            shadowColor: Colors.transparent,
            backgroundColor: Colors.blue.withOpacity(0.7),

            foregroundColor: Colors.white,
            // Set the padding
          ),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: save,
          child: const Text("Save"),
        ),
      ],
    );
  }
}
