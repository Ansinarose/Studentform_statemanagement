// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sqflite/sqflite.dart' as sql;

// class DatabaseController extends GetxController {
//   late sql.Database _database;
//   bool get isDatabaseInitialized => _database != null;

//   @override
//   void onInit() {
//     super.onInit();
//     initDatabase();
//   }

//   /// Initializes the SQLite database.
//   Future<void> initDatabase() async {
//     try {
//       _database = await sql.openDatabase(
//         "data.db",
//         version: 1,
//         onCreate: (sql.Database database, int version) async {
//           await createTables(database);
//         },
//       );
//     } catch (e) {
//       // Handle database initialization error
//       print("Error initializing database: $e");
//     }
//   }

//   /// Creates necessary tables in the database.
//   Future<void> createTables(sql.Database database) async {
//     try {
//       await database.execute(
//         """CREATE TABLE data(
//            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
//            name TEXT,
//            age TEXT,
//            contact TEXT,
//            rollnumber TEXT,
//            images TEXT
//         )""",
//       );
//     } catch (e) {
//       // Handle table creation error
//       print("Error creating tables: $e");
//     }
//   }

//   /// Inserts a new record into the database.
//   Future<int> createData(
//     String name,
//     String age,
//     String contact,
//      String rollnumber,
//     String images,
   
//   ) async {
//     try {
//       final data = {
//         "name": name,
//         "age": age,
//         "contact": contact, 
//         "rollnumber": rollnumber,// Changed from "phone" to "contact"
//         "images": images,
//          // Changed from "gender" to "rollnumber"
//       };
//       final id = await _database.insert(
//         "data",
//         data,
//         conflictAlgorithm: sql.ConflictAlgorithm.replace,
//       );
//       update(); // Notify GetX that data has changed
//       return id;
//     } catch (e) {
//       // Handle insertion error
//       print("Error inserting data: $e");
//       return -1; // Return -1 to indicate failure
//     }
//   }

//   /// Retrieves all records from the database.
//   Future<List<Map<String, dynamic>>> getAllData() async {
//     try {
//       return await _database.query("data", orderBy: "id");
//     } catch (e) {
//       // Handle query error
//       print("Error querying data: $e");
//       return []; // Return empty list in case of error
//     }
//   }
// }

// DatabaseController

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:studentlist_statemanagement/controller/studentcontroller.dart';

class DatabaseController extends GetxController {
   late  sql.Database _database;
  bool get isDatabaseInitialized => _database != null;

  @override
  void onInit() {
    super.onInit();
    initDatabase();
  }

  Future<void> initDatabase() async {
    try {
      _database = await sql.openDatabase(
        "data.db",
        version: 1,
        onCreate: (sql.Database database, int version) async {
          await createTables(database);
        },
      );
    } catch (e) {
      print("Error initializing database: $e");
    }
  }

  Future<void> createTables(sql.Database database) async {
    try {
      await database.execute(
        """CREATE TABLE IF NOT EXISTS data(
           id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
           name TEXT,
           age TEXT,
           contact TEXT,
           rollnumber TEXT,
           images TEXT
        )""",
      );
    } catch (e) {
      print("Error creating tables: $e");
    }
  }

  Future<int> createData(
    String name,
    String age,
    String contact,
    String rollnumber,
    String images,
  ) async {
    try {
      final data = {
        "name": name,
        "age": age,
        "contact": contact,
        "rollnumber": rollnumber,
        "images": images,
      };
      final id = await _database.insert(
        "data",
        data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace,
      );
      update(); // Notify GetX that data has changed
      return id;
    } catch (e) {
      print("Error inserting data: $e");
      return -1;
    }
  }


  Future<List<Map<String, dynamic>>> getAllData() async {  
    try {
      return await _database.query("data", orderBy: "id");
    } catch (e) {
      print("Error querying data: $e");
      return [];
    }
    
  }
}