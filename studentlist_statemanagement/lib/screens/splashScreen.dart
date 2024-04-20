import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:studentlist_statemanagement/screens/studentlist.dart';

class SplashScreen extends StatelessWidget {
 SplashScreen({Key? key}) : super(key: key) {
  gotoNextScreen();
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/Animation - 1711475544104.json'),
      ),
    );
  }

  void gotoNextScreen()  async {
    await Future.delayed(Duration(seconds: 3));
    Get.off(() => StudentList());
  }
}