import 'package:employers_management/home/views/add_employes_details_view.dart';
import 'package:employers_management/home/widgets/employee_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/providers.dart';

class EmployeeListView extends ConsumerWidget {
  const EmployeeListView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final emp = ref.watch(employeeProvider);

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
    final emp = ref.watch(employeeProvider);
    final prevEmp = emp.where((e) => e.endDate != null).toList();
    final currEmp = emp.where((e) => e.endDate == null).toList();
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: currEmp.isNotEmpty
              ? const ListTile(
                  title: Text(
                    "Current employee",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return EmployeeListTile(employee: currEmp[index]);
            },
            childCount: currEmp.length,
          ),
        ),
        SliverToBoxAdapter(
          child: prevEmp.isNotEmpty
              ? const ListTile(
                  title: Text(
                    "Previous employee",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return EmployeeListTile(employee: prevEmp[index]);
            },
            childCount: prevEmp.length,
          ),
        ),
      ],
    );
    /* return SizedBox(
      child: ListView.builder(
        itemCount: emp.length,
        itemBuilder: (context, index) {
          return EmployeeListTile(employee: emp[index]);
        },
      ),
    ); */
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
