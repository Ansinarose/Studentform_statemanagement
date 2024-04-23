
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentlist_statemanagement/Model/db_helper.dart';
import 'package:studentlist_statemanagement/controller/studentcontroller.dart';
import 'package:studentlist_statemanagement/widgets/age_widget.dart';
import 'package:studentlist_statemanagement/widgets/button_widget.dart';
import 'package:studentlist_statemanagement/widgets/contact_widget.dart';
import 'package:studentlist_statemanagement/widgets/name_widget.dart';
import 'package:studentlist_statemanagement/widgets/rollnum_widget.dart';

class ScreenEdit extends StatelessWidget {
  final StudentController studentController = Get.find<StudentController>();
  final Map<String, dynamic> studentData;

  ScreenEdit({required this.studentData});

  final userNameController = TextEditingController();
  final userAgeController = TextEditingController();
  final userContactController = TextEditingController();
  final userRollNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  
  bool editname = false;
 String? imagePath;

  @override
  Widget build(BuildContext context) {
    userNameController.text = studentData['name'] ?? '';
    userAgeController.text = studentData['age'] ?? '';
    userContactController.text = studentData['contact'] ?? '';
    userRollNumberController.text = studentData['rollnumber'] ?? '';
    imagePath = studentData['images'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Student"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 8, 75, 120),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Edit student details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20,),
                 

                  Obx(() {
  final imagePath = Get.find<StudentController>().imagePath.value;
  return Container(
    height: 150,
    width: 150,
    decoration: BoxDecoration(
      image: imagePath != null
          ? DecorationImage(
              image: FileImage(File(imagePath)),
              fit: BoxFit.cover,
            )
          : null,
      border: Border.all(),
      borderRadius: BorderRadius.circular(20),
    ),
    child: imagePath == null
        ? Image(image: AssetImage('assets/MAN.webp'))
        : null,
  );
}),

                  SizedBox(height: 20),
                  // Button to pick or change the image
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue)
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: Colors.blue[50],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(width: 5, color: Colors.blue),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    'Camera',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Get.find<StudentController>().pickImageFromCamera();
                                      Get.back();
                                    },
                                    icon: const Icon(Icons.camera_alt),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Gallery',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Get.find<StudentController>().pickImageFromGallery();
                                      
                                      Get.back();
                                    },
                                    icon: const Icon(Icons.photo_album_outlined),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Text('Change Image',
                    style: TextStyle(
                      color: Colors.black
                    ),),
                  ),
                  
                  SizedBox(height: 20),
                  NameScreen(validateName: true, userNameController: userNameController, editname: editname,),
                  SizedBox(height: 20),
                  AgeScreen(validateAge: true, userAgeController: userAgeController, editname: editname,),
                  SizedBox(height: 20),
                  ContactScreen(validateContact: true, userContactController: userContactController, editname: editname,),
                  SizedBox(height: 20),
                  RollNUmberScreen(validateRollNumber: true, userRollNumberController: userRollNumberController, editname: editname,),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: 
                    MaterialStateProperty.all<Color>(Colors.blue) ),
                    onPressed: (){
if (formKey.currentState!.validate()) {
      String name = userNameController.text;
      String age = userAgeController.text;
      String contact = userContactController.text;
      String rollnumber = userRollNumberController.text;
      String imagePath = Get.find<StudentController>().imagePath.value;
      
      int id = studentData['id']; // Get the ID of the student data being edited
      
      DatabaseController databaseController = Get.find<DatabaseController>();
      databaseController.updateData(id, name, age, contact, rollnumber, imagePath)
        .then((rowsUpdated) {
          if (rowsUpdated > 0) {
            Get.back(); // Navigate back to previous screen if update successful
          } else {
            // Handle update failure
            // You can show an error message to the user
            print('Failed to update student data');
          }
        });
    }

                    }, 
                    child: Text('Edit Students',style: TextStyle(
                      color: Colors.black
                    ),))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onSavePressed() {
    if (formKey.currentState!.validate()) {
      // Save changes to database
      Get.back(); // Navigate back to previous screen
    }
  }
}
