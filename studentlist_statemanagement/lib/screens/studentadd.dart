// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentlist_statemanagement/controller/studentcontroller.dart';
import 'package:studentlist_statemanagement/widgets/age_widget.dart';
import 'package:studentlist_statemanagement/widgets/button_widget.dart';
import 'package:studentlist_statemanagement/widgets/contact_widget.dart';
import 'package:studentlist_statemanagement/widgets/rollnum_widget.dart';
import 'package:studentlist_statemanagement/widgets/name_widget.dart';

class StudentAdd extends StatelessWidget {
   StudentAdd({Key? key});

  var userNameController = TextEditingController();
  var userAgeController = TextEditingController();
  var userContactController = TextEditingController();
  var userRollNumberController = TextEditingController();

  bool validateName = false;
  bool validateAge = false;
  bool validateContact = false;
  bool validateRollNumber = false;

  @override
  Widget build(BuildContext context) {
    Get.put(StudentController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD STUDENT"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 8, 120, 41),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Add student details',
                    style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                    },
                    child: Stack(
                      children: [
                        Obx(() {
                          final imagePath =
                              Get.find<StudentController>().imagePath.value;
                          if (imagePath == null || imagePath.isEmpty) {
                            return Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Image(image: AssetImage('assets/MAN.webp')),
                            );
                          } else {
                            return Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(
                                    File(imagePath),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            );
                          }
                        }),
                        Positioned(
                          bottom: 50,
                          right: 10,
                          child: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context, 
                                builder: (context) => AlertDialog(
                                  backgroundColor: Colors.green[50],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(width: 5, color: Colors.green),
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
                                            onPressed: (){
                                              Get.find<StudentController>().pickImageFromCamera();   
                                                Get.back();
                                            }, 
                                            icon: const Icon(Icons.camera_alt)
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
                                            onPressed: (){
                                              Get.find<StudentController>().pickImageFromGallery();
                                                Get.back();
                                            }, 
                                            icon: const Icon(Icons.photo_album_outlined)
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              );
                            },
                            icon: const Icon(Icons.camera_alt,
                            size: 35,),
                          ),
                        ),
                        Positioned(
                          child: IconButton(
                            onPressed: () {
                              Get.find<StudentController>().clearImage();
                            },
                            icon: const Icon(Icons.cancel),
                          ),
                        ),
                      
                      ],
                    ),
                  ),
                   const SizedBox(height: 20,),

                        NameScreen(
                          validateName: validateName, 
                          userNameController: userNameController),
                         
                          const SizedBox(height: 20,),
                          
                        AgeScreen(
                            userAgeController: userAgeController,
                             validateAge: validateAge),
                              const SizedBox(height: 20,),
                        ContactScreen(userContactController: userContactController,
                         validateContact: validateContact),
                          const SizedBox(height: 20,),
                        RollNUmberScreen(userRollNumberController: userRollNumberController, 
                        validateRollNumber: validateRollNumber),
                        const SizedBox(height: 20,),
                        ButtonWidget(
                          userNameController: userNameController, 
                          userAgeController: userAgeController, 
                          userContactController: userContactController, 
                          userRollNumberController: userRollNumberController,
                          
                          
                          )
                          

                ],
              ),
            ),
            
          ),
          
        ),
        
      ),
    );
  }
}
