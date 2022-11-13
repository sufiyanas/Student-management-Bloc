import 'dart:io';
import 'package:attentance_book/db/model/data_model.dart';
import 'package:attentance_book/screens/studentdetails.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class searchstudent extends StatefulWidget {
  const searchstudent({Key? key}) : super(key: key);
  @override
  State<searchstudent> createState() => _searchstudentState();
}

class _searchstudentState extends State<searchstudent> {
  List<StudentModal> studentList =
      Hive.box<StudentModal>('student_db').values.toList();
  late List<StudentModal> displayStudent = List<StudentModal>.from(studentList);

  void updateList(String value) {
    setState(() {
      displayStudent = studentList
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          TextFormField(
            onChanged: (value) {
              updateList(value);
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              hintText: "Search here",
            ),
          ),
          Expanded(
            child: (displayStudent.isNotEmpty)
                ? ListView.separated(
                    itemBuilder: (context, index) {
                      final data = displayStudent[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              FileImage(File(displayStudent[index].image)),
                        ),
                        title: Text(displayStudent[index].name),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((ctx) => Studentdetails(
                                  data: data,
                                )),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: displayStudent.length)
                : const Center(child: Text("Empty")),
          )
        ]),
      ),
    );
  }
}
