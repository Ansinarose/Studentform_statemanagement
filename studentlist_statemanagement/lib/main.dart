import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentlist_statemanagement/Model/db_helper.dart';
import 'package:studentlist_statemanagement/controller/studentcontroller.dart';
import 'package:studentlist_statemanagement/screens/splashScreen.dart';
import 'package:studentlist_statemanagement/screens/studentlist.dart';


void main() {
  // Initialize GetX bindings
  WidgetsFlutterBinding.ensureInitialized();
   Get.put(DatabaseController());
  // Initialize StudentController
  Get.put(StudentController());
  // Run the application
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
 // const MyApp({super.key});
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      title: 'Student list- state management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:   SplashScreen(),
    );
  }
}

