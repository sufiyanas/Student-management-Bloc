import 'package:attentance_book/db/model/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<StudentModal>> StudentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModal value) async {
  // StudentListNotifier.value.add(value);
  final studentdb = await Hive.openBox<StudentModal>('student_db');
  await studentdb.add(value);
  StudentListNotifier.value.add(value);

  StudentListNotifier.notifyListeners();
}

Future<void> getAllStudents() async {
  final studentdb = await Hive.openBox<StudentModal>('student_db');
  StudentListNotifier.value.clear();

  StudentListNotifier.value.addAll(studentdb.values);
  StudentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int key) async {
  final studentdb = await Hive.openBox<StudentModal>('student_db');
  await studentdb.delete(key);

  getAllStudents();
}

Future<void> editStudent(int key, StudentModal value) async {
  final studentdb = await Hive.openBox<StudentModal>('student_db');
  await studentdb.put(key, value);
  getAllStudents();
}
