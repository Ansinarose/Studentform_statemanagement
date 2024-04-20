
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:studentlist_statemanagement/Model/db_helper.dart';
import 'package:studentlist_statemanagement/screens/editStudent.dart';
import 'package:studentlist_statemanagement/screens/profile.dart';
import 'package:studentlist_statemanagement/screens/studentadd.dart';

class StudentList extends StatelessWidget {
  final DatabaseController databaseController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 8, 120, 41),
        title: const Text("STUDENT LIST"),
      ),
      body: GetBuilder<DatabaseController>(
        init: databaseController,
        builder: (controller) {
          return FutureBuilder<List<Map<String, dynamic>>>(
            future: controller.getAllData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError || snapshot.data == null) {
                return Center(
                  child: Text('Error: Unable to fetch data'),
                );
              }
              final data = snapshot.data!;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => ScreenProfile(studentData: item));
                    },
                    child: Container(height: 100,
                      child: Card(
                        
                        color: Colors.green[200],
                        margin: EdgeInsets.all(15),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: item['images'] != null
                                ? FileImage(File(item['images']))
                                : null,
                          ),
                          title: Text(item['name'] ?? ''),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  Get.to((ScreenEdit(studentData: item)));
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {

                                   showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //title: Text("Confirmation"),
          content: Text("Are you sure you want to delete this item?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                databaseController.deleteData(item['id']); // Delete the item
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Delete"),
            ),
          ],
        );
      }
                                   );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 8, 120, 41),
        onPressed: () {
          Get.to(() => StudentAdd());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}




