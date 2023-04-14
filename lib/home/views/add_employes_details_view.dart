import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddEmployesDetailsView extends StatefulWidget {
  const AddEmployesDetailsView({super.key});

  @override
  State<AddEmployesDetailsView> createState() => _AddEmployesDetailsViewState();
}

class _AddEmployesDetailsViewState extends State<AddEmployesDetailsView> {
  final _formKey = GlobalKey<FormBuilderState>();
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
            children: [
              FormBuilderTextField(
                name: "name",
                decoration: const InputDecoration(
                  label: Text("Employee name"),
                  prefixIcon: Icon(
                    Icons.person_pin,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.h),
              FormBuilderDropdown(
                name: "role",
                decoration: const InputDecoration(
                  label: Text("Select ROLE"),
                  prefixIcon: Icon(Icons.work),
                  border: OutlineInputBorder(),
                ),
                items: [],
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () {},
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
          onPressed: () {},
          child: const Text("Save"),
        ),
      ],
    );
  }
}
