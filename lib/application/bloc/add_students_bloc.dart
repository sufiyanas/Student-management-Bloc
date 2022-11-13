import 'package:attentance_book/db/model/data_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

part 'add_students_event.dart';
part 'add_students_state.dart';

class AddStudentsBloc extends Bloc<AddStudentsEvent, AddStudentsState> {
  AddStudentsBloc() : super(AddStudentsInitial()) {
    final Box<StudentModal> studentHiveBox = Hive.box('student_db');
    on<AddStudent>((event, emit) async {
      await studentHiveBox.add(event.student);
      final studentDataCleard = StudentModal(
          name: " ", classs: " ", divission: " ", rollno: " ", image: ' ');
      emit(AddStudentsState(initialstate: studentDataCleard));
    });
  }
}
