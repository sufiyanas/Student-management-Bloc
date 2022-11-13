part of 'add_students_bloc.dart';

@immutable
class AddStudentsState {
  StudentModal initialstate;

  AddStudentsState({required this.initialstate});
}

class AddStudentsInitial extends AddStudentsState {
  AddStudentsInitial()
      : super(
            initialstate: StudentModal(
          name: '',
          classs: '',
          divission: '',
          rollno: '',
          image: '',
        ));
}
