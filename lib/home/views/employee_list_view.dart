import 'package:employers_management/home/views/add_employes_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

class EmployeeListView extends ConsumerWidget {
  const EmployeeListView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final emp = ref.read(employeeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Employees List"),
      ),
      body: emp.isEmpty ? const NoEmployeesBody() : const EmployesListBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddEmployesDetailsView(),
          ));
        },
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(16.0), // Set the desired border radius
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class EmployesListBody extends ConsumerWidget {
  const EmployesListBody({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final emp = ref.read(employeeProvider);
    return SizedBox(
      child: ListView.builder(
        itemCount: emp.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(emp[index].name));
        },
      ),
    );
  }
}

class NoEmployeesBody extends StatelessWidget {
  const NoEmployeesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Image.asset('assets/no_employ.png'),
      ),
    );
  }
}
