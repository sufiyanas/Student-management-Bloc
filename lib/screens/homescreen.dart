import 'package:attentance_book/db/function/db_functions.dart';
import 'package:attentance_book/screens/add_sccreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:attentance_book/screens/searchscreen.dart';
import 'package:attentance_book/screens/listscreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentselectedindex = 1;
  final _pages = [
    Listscreen(),
    Addscreen(),
    searchstudent(),
  ];

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Students Data Book'),
      ),
      body: _pages[_currentselectedindex],
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 300),
        onTap: (newIndex) {
          setState(() {
            _currentselectedindex = newIndex;
          });
        },
        backgroundColor: Colors.white,
        color: Colors.brown,
        items: const [
          Icon(Icons.list),
          Icon(Icons.add),
          Icon(Icons.search),
        ],
      ),
    );
  }
}
