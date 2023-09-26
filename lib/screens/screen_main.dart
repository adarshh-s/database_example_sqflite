import 'package:database_example/db/functions/db_functions.dart';
import 'package:database_example/screens/widgets/add_student_widget.dart';
import 'package:database_example/screens/widgets/list_student_widget.dart';
import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudent();
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          AddStudentWidget(),
          const Expanded(child: ListStudentWidget())
        ],
      )),
    );
  }
}
