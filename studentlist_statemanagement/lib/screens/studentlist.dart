
// // StudentList
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:studentlist_statemanagement/Model/db_helper.dart';
// import 'package:studentlist_statemanagement/screens/studentadd.dart';

// class StudentList extends StatelessWidget {
//   @override
  
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 8, 120, 41),
//         title: const Text("STUDENT LIST"),
//       ),
//       body: GetBuilder<DatabaseController>(
//         //init: DatabaseController(),
//         builder: (controller) {
//           return FutureBuilder<List<Map<String, dynamic>>>(
//             future: controller.getAllData(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return CircularProgressIndicator();
//               }
//               if (snapshot.hasError) {
//                 return Text('Error: ${snapshot.error}');
//               }
//               final data = snapshot.data!;
//               return ListView.builder(
//                 itemCount: data.length,
//                 itemBuilder: (context, index) {
//                   final item = data[index];
//                   return Card(
//                     color: Colors.green[200],
//                     margin: EdgeInsets.all(15),
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         backgroundImage: item['images'] != null
//                             ? FileImage(File(item['images']))
//                             : null,
//                       ),
//                       title: Text(item['name']),
//                     ),
//                   );
//                 },
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: const Color.fromARGB(255, 8, 120, 41),
//         onPressed: () {
//           // Get.to(StudentAdd());
//           Get.to(() => StudentAdd());
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentlist_statemanagement/Model/db_helper.dart';
import 'package:studentlist_statemanagement/controller/studentcontroller.dart';
import 'package:studentlist_statemanagement/screens/studentadd.dart';

class StudentList extends StatelessWidget {
final DatabaseController databaseController=Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 8, 120, 41),
        title: const Text("STUDENT LIST"),
      ),
      body: GetBuilder<DatabaseController>(
        init: databaseController, // Initialize DatabaseController here
        builder: (controller) {
          return FutureBuilder<List<Map<String, dynamic>>>(
            future: controller.getAllData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              final data = snapshot.data!;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return Card(
                    color: Colors.green[200],
                    margin: EdgeInsets.all(15),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: item['images'] != null
                            ? FileImage(File(item['images']))
                            : null,
                      ),
                      title: Text(item['name']),
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
