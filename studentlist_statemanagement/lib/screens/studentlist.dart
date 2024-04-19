// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// // ignore: unused_import
// import 'package:studentlist_statemanagement/controller/studentcontroller.dart';
// import 'package:studentlist_statemanagement/screens/studentadd.dart';

// class StudentList extends StatelessWidget {
//   const StudentList({super.key});
//   //final StudentController studentController = Get.put(StudentController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 8, 120, 41),
//         title: const Text("STUDENT LIST"),
      
//       ),
//       body: SingleChildScrollView(
//         child: Card(
//           child: ListTile(
//             title: Text(''),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: const Color.fromARGB(255, 8, 120, 41), 
//         onPressed: (){

//           Get.to( StudentAdd());
//         },
//          child: const Icon(Icons.add),
//         ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentlist_statemanagement/Model/db_helper.dart';
import 'package:studentlist_statemanagement/screens/studentadd.dart';
// Import your SQLHelper class

class StudentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 8, 120, 41),
        title: const Text("STUDENT LIST"),
      ),
      body: GetBuilder<DatabaseController>(
        init: DatabaseController(), // Initialize the database controller
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
                  return ListTile(
                    title: Text(item['name']),
                    subtitle: Text(item['age']),
                    // Display other fields as needed
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
          Get.to(StudentAdd());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
