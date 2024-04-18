import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: unused_import
import 'package:studentlist_statemanagement/controller/studentcontroller.dart';
import 'package:studentlist_statemanagement/screens/studentadd.dart';

class StudentList extends StatelessWidget {
  const StudentList({super.key});
  //final StudentController studentController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 8, 120, 41),
        title: const Text("STUDENT LIST"),
      
      ),
      body: SingleChildScrollView(
        child: Card(
          child: ListTile(
            title: Text(''),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 8, 120, 41), 
        onPressed: (){

          Get.to( StudentAdd());
        },
         child: const Icon(Icons.add),
        ),
    );
  }
}