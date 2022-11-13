import 'package:attentance_book/application/bloc/add_students_bloc.dart';
import 'package:attentance_book/db/model/data_model.dart';
import 'package:attentance_book/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(StudentModalAdapter());
  }
  await Hive.openBox<StudentModal>('student_db');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddStudentsBloc()),
        // BlocProvider(create: (context) => EditStudentBloc()),
        // BlocProvider(create: (context) => SearchStudentBloc()),
      ],
      child: MaterialApp(
        title: 'attandance_app',
        theme: ThemeData(
          primarySwatch: Colors.brown,
          backgroundColor: Color.fromARGB(96, 9, 196, 221),
        ),
        home: const Splashscreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
