import 'package:employers_management/home/models/employee.dart';
import 'package:employers_management/home/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<List<Employee>>('employees_box');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) {
        return MaterialApp(
          title: 'Employee List',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const EmployeeListView(),
        );
      },
    );
  }
}
