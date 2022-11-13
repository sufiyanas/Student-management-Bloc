import 'dart:io';
import 'package:attentance_book/db/function/db_functions.dart';
import 'package:attentance_book/db/model/data_model.dart';
import 'package:attentance_book/screens/add_sccreen.dart';
import 'package:flutter/material.dart';

class Editscreen extends StatefulWidget {
  Editscreen({
    Key? key,
    required this.student,
    required this.index,
    required this.studentlist,
  }) : super(key: key);

  StudentModal student;
  int index;
  final studentlist;

  @override
  State<Editscreen> createState() => _EditscreenState();
}

class _EditscreenState extends State<Editscreen> {
  TextEditingController? _nameController;
  TextEditingController? _classController;
  TextEditingController? _divissionController;
  TextEditingController? _rollnumberController;
  @override
  void initState() {
    // TODO: implement initState
    _nameController = TextEditingController(text: widget.student.name);
    _classController = TextEditingController(text: widget.student.classs);
    _divissionController =
        TextEditingController(text: widget.student.divission);
    _rollnumberController = TextEditingController(text: widget.student.rollno);

    super.initState();
  }

  Future<void> editstudentclick() async {
    final name = _nameController!.text;
    final classs = _classController!.text;
    final division = _divissionController!.text;
    final rollno = _rollnumberController!.text;

    if (name.isEmpty || classs.isEmpty || division.isEmpty || rollno.isEmpty) {
      return;
    }
    final _student = StudentModal(
        name: name,
        classs: classs,
        divission: division,
        rollno: rollno,
        image: widget.student.image);
    editStudent(widget.student.key, _student);
    Navigator.pop(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            circleAvatharFunction(),
            sizedboxfunction(20, 0),
            textFieldFunction(_nameController!, 'name', 'Name:'),
            sizedboxfunction(20, 0),
            textFieldFunction(_classController!, 'class', 'Class:'),
            sizedboxfunction(20, 0),
            textFieldFunction(_divissionController!, 'divission', 'Divission:'),
            sizedboxfunction(20, 0),
            textFieldFunction(
                _rollnumberController!, 'roll number', 'Roll number:'),
            ElevatedButton(
                onPressed: () {
                  editstudentclick();
                },
                child: Text('Save')),
          ],
        ),
      ),
    );
  }

//sized box
  Widget sizedBoxFuncton(double width, double hight) {
    return SizedBox(
      width: width,
      height: hight,
    );
  }

//Circle Avathar function
  Widget circleAvatharFunction() {
    return CircleAvatar(
      radius: 100,
      backgroundImage: FileImage(File(widget.student.image)),
    );
  }

  //delete pop up
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {},
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text(
          "Would you like to continue learning how to use Flutter alerts?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
//delete popup ends

//Text field function
  Widget textFieldFunction(
      TextEditingController controllername, String labaltext, String hinttext) {
    return TextField(
      controller: controllername,
      style: const TextStyle(
          fontSize: 18.0, color: Color.fromARGB(255, 13, 93, 174)),
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintStyle: TextStyle(color: Colors.grey[800]),
          labelText: "$hinttext:$labaltext",
          fillColor: Colors.black45),
    );
  }
}
