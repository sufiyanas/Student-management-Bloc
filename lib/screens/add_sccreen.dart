import 'dart:io';
import 'package:attentance_book/application/bloc/add_students_bloc.dart';
import 'package:attentance_book/db/function/db_functions.dart';
import 'package:attentance_book/db/model/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class Addscreen extends StatefulWidget {
  Addscreen({Key? key}) : super(key: key);
  @override
  State<Addscreen> createState() => _AddscreenState();
}

class _AddscreenState extends State<Addscreen> {
  final _formKey = GlobalKey<FormState>();
  String? _imageFile;
  final ImagePicker picker = ImagePicker();
  final _namecontroller = TextEditingController();
  final _classcontroller = TextEditingController();
  final _divissoncontroller = TextEditingController();
  final _rollnocontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: ListView(children: [
          imageprofile(),
          iconbuttonfunction(context),
          sizedboxfunction(20, 0),
          textfieldfunction(
            _namecontroller,
            'Full name',
            TextInputType.name,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter age';
              }
              // if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
              //   return 'Please enter a valid Age';
              // }
              return null;
            },
          ),
          sizedboxfunction(20, 0),
          textfieldfunction(
            _classcontroller,
            'Class',
            TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter age';
              }
              // if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
              //   return 'Please enter a valid Age';
              // }
              return null;
            },
          ),
          sizedboxfunction(20, 0),
          textfieldfunction(
            _divissoncontroller,
            'Divission',
            TextInputType.name,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your Division';
              }
              // if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
              //   return 'Please enter a valid Age';
              // }
              return null;
            },
          ),
          sizedboxfunction(20, 0),
          textfieldfunction(
            _rollnocontroller,
            'Roll number',
            TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter age';
              }
              if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                return 'Please enter a valid Age';
              }
              return null;
            },
          ),
          sizedboxfunction(20, 0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                onAddStudentButtonClicked();
                // ignore: deprecated_member_use

                const SnackBar(
                  backgroundColor: Colors.brown,
                  content: Text('Data added'),
                );
              }
            },
            child: const Text('Add'),
          )
        ]),
      ),
    );
  }

//For Button Clcked
  Future<void> onAddStudentButtonClicked() async {
    final _name = _namecontroller.text.trim();
    final _class = _classcontroller.text.trim();
    final _divission = _divissoncontroller.text.trim();
    final _rollno = _rollnocontroller.text.trim();

    if (_name.isEmpty ||
        _class.isEmpty ||
        _divission.isEmpty ||
        _rollno.isEmpty) {
      return;
    }

    final student = StudentModal(
      name: _name,
      classs: _class,
      divission: _divission,
      rollno: _rollno,
      image: _imageFile!,
    );
    BlocProvider.of<AddStudentsBloc>(context).add(AddStudent(student: student));
    clearText();
  }

// text field funcion
  Widget textfieldfunction(
      TextEditingController controller, String labaltext, TextInputType Type,
      {required String? Function(dynamic value) validator}) {
    return TextFormField(
      keyboardType: Type,
      validator: validator,
      controller: controller,
      style: const TextStyle(
          fontSize: 18.0, color: Color.fromARGB(255, 13, 93, 174)),
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintStyle: TextStyle(color: Colors.grey[800]),
          labelText: "$labaltext",
          fillColor: Colors.black45),
    );
  }

  //Clearing textbox after saving
  void clearText() {
    _namecontroller.clear();
    _rollnocontroller.clear();
    _divissoncontroller.clear();
    _classcontroller.clear();

    setState(() {
      _imageFile = null;
    });
  }

//Icon Field Function
  Widget iconbuttonfunction(BuildContext context) {
    return IconButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return botomsheet();
            },
          );
        },
        icon: const Icon(Icons.file_upload, size: 50, color: Colors.brown));
  }

  // Take Photo from galary
  Future<void> takePhotoGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = image!.path;
    });
  }

  //Take Photo from camara
  Future<void> takePhotoCamara() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _imageFile = image!.path;
    });
  }

//for popup sheet if clicking add button on upload image
  Widget botomsheet() {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          const Text(
            'Choose Profile Photo',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    takePhotoCamara();
                  },
                  child: const Icon(
                    Icons.camera,
                  )),
              TextButton(
                  onPressed: () {
                    takePhotoGallery();
                  },
                  child: const Icon(Icons.image)),
            ],
          )
        ],
      ),
    );
  }

  // profile image
  imageprofile() {
    return CircleAvatar(
      //  backgroundImage: AssetImage('assets/images/profile_pic.jfif'),
      backgroundImage: (_imageFile == null)
          ? const AssetImage('assets/images/profile_pic.jfif')
          : FileImage(File(_imageFile!)) as ImageProvider,

      radius: 100,
    );
  }
}

//sized Box
sizedboxfunction(double height, double width) {
  return SizedBox(
    height: height,
    width: width,
  );
}
