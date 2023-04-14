import 'package:employers_management/home/models/employee.dart';
import 'package:employers_management/home/providers/employee_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../views/views.dart';

class EmployeeListTile extends ConsumerWidget {
  final Employee employee;
  const EmployeeListTile({super.key, required this.employee});

  @override
  Widget build(BuildContext context, ref) {
    final empP = ref.read(employeeProvider.notifier);
    var startDate = DateFormat('dd MMM,yyyy').format(employee.startDate);
    onDelete() async {
      await empP.removeEmployee(employee);
      Fluttertoast.showToast(
          msg: "Employee deleted !!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    onTap() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AddEmployesDetailsView(employee: employee),
        ),
      );
    }

    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: Container(color: Colors.red),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 2,

            onPressed: (context) => onDelete(),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            // label: 'Delete',
          ),
        ],
      ),
      child: ListTile(
        isThreeLine: true,
        onTap: onTap,
        title: Text(
          employee.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(employee.role.name.replaceFirst("_", " ")),
            Text(
                "From $startDate ${employee.endDate != null ? DateFormat('dd MMM,yyyy').format(employee.endDate!) : " - Continue"}"),
          ],
        ),
      ),
    );
  }
}
