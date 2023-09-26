import 'package:database_example/db/functions/db_functions.dart';
import 'package:database_example/db/model/data_model.dart';
import 'package:flutter/material.dart';

class AddStudentWidget extends StatelessWidget {
  AddStudentWidget({super.key});

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your name',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _ageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your age',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  onAddStudentButtonClicked();
                },
                icon: const Icon(Icons.add),
                label: const Text('submit'))
          ],
        ));
  }

  Future<void> onAddStudentButtonClicked() async {
    String name = _nameController.text;
    String age = _ageController.text;
    if (name.isEmpty || age.isEmpty) {
      return;
    }
    final student = StudentModel(name: name, age: age);
    addStudent(student);
  }
}
