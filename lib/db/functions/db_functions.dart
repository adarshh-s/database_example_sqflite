// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:database_example/db/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

late Database _db;

Future<void> initializeDatabase() async {
  _db = await openDatabase('student.db', version: 1,
      onCreate: (Database db, int version) async {
    await db.execute('''
      CREATE TABLE student(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        age INTEGER NOT NULL
      )
    ''');
  });
}

Future<void> addStudent(StudentModel value) async {
  //final studentDb = await Hive.openBox<StudentModel>('student_db');
  // final _id = await studentDb.add(value);
  //value.id = _id;
  await _db.rawInsert(
      'INSERT INTO student (name,age) VALUES (?,?)', [value.name, value.age]);
  getAllStudent();
  //studentListNotifier.value.add(value);
  //studentListNotifier.notifyListeners();
}

Future<void> getAllStudent() async {
  //final studentDb = await Hive.openBox<StudentModel>('student_db');

  final _values = await _db.rawQuery('SELECT * FROM students');
  studentListNotifier.value.clear();
  _values.forEach((map) {
    final student = StudentModel.fromMap(map);
    studentListNotifier.value.add(student);
    studentListNotifier.notifyListeners();
  });

  //studentListNotifier.value.addAll(studentDb.values);

  studentListNotifier.notifyListeners();
}

Future<void> deleteItem(int id) async {
  // final studentDb = await Hive.openBox<StudentModel>('student_db');
  // studentDb.delete(id);
  await _db.rawDelete('DELETE FROM student WHERE id = ?', [id]);
  getAllStudent();
}
