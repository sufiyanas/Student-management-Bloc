part of 'add_students_bloc.dart';

abstract class AddStudentsEvent {}

class AddStudent extends AddStudentsEvent {
  final StudentModal student;
  AddStudent({required this.student
      // required this.name,
      // required this.classs,
      // required this.divission,
      // required this.rollno,
      // required this.image
      });

  // String name;
  // String classs;
  // String divission;
  // String rollno;
  // String image;
}
