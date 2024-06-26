// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class RollNUmberScreen extends StatelessWidget {
   RollNUmberScreen({super.key,
   required this.userRollNumberController,
   required this.validateRollNumber, 
   required this.editname});

  final  TextEditingController userRollNumberController;
  bool validateRollNumber = false;
  final bool editname;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if(value == null || value.isEmpty){
          return "Roll Number is required";
        }
        return null;
      },
      keyboardType: TextInputType.number,
      controller: userRollNumberController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.calendar_month),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green, width: 1,
          ),
          borderRadius:
         BorderRadius.all(Radius.circular(15))
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))

        ),
        labelText: 'Roll Number',
        errorText:editname && validateRollNumber ?  'Roll Number Not Found' : null,
      ),
    );
  }
}