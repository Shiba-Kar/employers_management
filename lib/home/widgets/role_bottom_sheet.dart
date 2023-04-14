import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/employee.dart';

class RoleBottomSheet extends StatelessWidget {
  const RoleBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var roles = Role.values.toList();
    onTap(Role role) {
      Navigator.of(context).pop(role);
    }

    return SizedBox(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(roles[index].name.replaceFirst("_", " ")),
            onTap: () => onTap(roles[index]),
          );
        },
        itemCount: roles.length,
      ),
    );
  }
}
