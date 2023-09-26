// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:database_example/db/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

late Database _db;

Future<void> initializeDatabase() async {
  _db = await openDatabase('student.db', version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(
        'CREATE TABLE student(id INTEGER PRIMARY KEY, name TEXT,  age TEXT)');
  });
}

Future<void> addStudent(StudentModel value) async {
  await _db.rawInsert(
      'INSERT INTO student (name,age) VALUES (?,?)', [value.name, value.age]);
  getAllStudent();
}

Future<void> getAllStudent() async {
  final values = await _db.rawQuery('SELECT * FROM student');
  print(values);
  studentListNotifier.value.clear();
  for (var map in values) {
    final student = StudentModel.fromMap(map);
    studentListNotifier.value.add(student);
    studentListNotifier.notifyListeners();
  }

  studentListNotifier.notifyListeners();
}

Future<void> deleteItem(int id) async {
  await _db.rawDelete('DELETE FROM student WHERE id = ?', [id]);
  getAllStudent();
}
