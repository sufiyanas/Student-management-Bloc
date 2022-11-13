import 'dart:io';
import 'package:attentance_book/db/function/db_functions.dart';
import 'package:attentance_book/db/model/data_model.dart';
import 'package:attentance_book/screens/edit_screen.dart';
import 'package:attentance_book/screens/studentdetails.dart';

import 'package:flutter/material.dart';

class Listscreen extends StatelessWidget {
  Listscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: StudentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModal> studentList, Widget? child) {
        return Container(
          padding: EdgeInsets.all(10),
          child: ListView.separated(
            itemBuilder: (ctx, index) {
              final data = studentList[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: FileImage(File(data.image)),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => Editscreen(
                                studentlist: studentList,
                                index: index,
                                student: data,
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.edit)),
                    PopupMenuButton(
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem(
                          child: Text('Edit'),
                          onTap: () {
                            // print("edit button pressed");
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (ctx) => Editscreen()));
                          },
                        ),
                        PopupMenuItem(
                          child: Text(
                            'View',
                          ),
                          onTap: () => listView(context, data),
                        ),
                        PopupMenuItem(
                          child: Text('Delete'),
                          onTap: () {
                            deleteStudent(data.key);
                            // ignore: deprecated_member_use

                            const SnackBar(
                              backgroundColor: Colors.brown,
                              content: Text('Data Deleted'),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                title: Text(data.name),
                subtitle: Text(data.classs),
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
            separatorBuilder: ((context, index) {
              return const Divider();
            }),
            itemCount: studentList.length,
          ),
        );
      },
    );
  }

  listView(BuildContext context, data) {}
}
