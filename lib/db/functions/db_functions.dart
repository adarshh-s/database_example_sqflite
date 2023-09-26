// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:database_example/db/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  final _id = await studentDb.add(value);
  value.id = _id;
  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
}

Future<void> getAllStudent() async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDb.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteItem(int id) async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  studentDb.delete(id);
  getAllStudent();
}
