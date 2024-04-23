// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, 
 required this.userNameController,
 required this.userAgeController, 
 required this.userContactController,
 required this.userRollNumberController,
 required this.onSavepressed
 });

final TextEditingController userNameController;
final TextEditingController userAgeController;
  final TextEditingController userContactController;
  final TextEditingController userRollNumberController;
  final VoidCallback? onSavepressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
       style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue)),
      onPressed:onSavepressed,
       child: const Text('Add Student',
       style: TextStyle(
        color: Colors.black
       ),));
  }
}
