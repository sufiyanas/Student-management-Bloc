import 'dart:io';
import 'package:attentance_book/db/model/data_model.dart';
import 'package:attentance_book/screens/add_sccreen.dart';
import 'package:flutter/material.dart';

class Studentdetails extends StatelessWidget {
  Studentdetails({Key? key, required this.data}) : super(key: key);
  StudentModal data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: FileImage(File(data.image)),
              ),
              sizedboxfunction(20, 0),
              Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    'Full Name : ${data.name}',
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 112, 60, 5)),
                  ))),
              sizedboxfunction(20, 0),
              Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    'Class: ${data.classs}',
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 112, 60, 5)),
                  ))),
              sizedboxfunction(20, 0),
              Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    'Divission :${data.divission}',
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 112, 60, 5)),
                  ))),
              sizedboxfunction(20, 0),
              Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    'Roll number: ${data.rollno}',
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 112, 60, 5)),
                  ))),
              sizedboxfunction(20, 0)
            ],
          ),
        ),
      ),
    );
  }
}
