import 'package:flutter/material.dart';

class RollNUmberScreen extends StatelessWidget {
   RollNUmberScreen({super.key,
   required this.userRollNumberController,
   required this.validateRollNumber});

  final  TextEditingController userRollNumberController;
  bool validateRollNumber = false;

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
        errorText: validateRollNumber ? 'Roll Number Not Found' : null,
      ),
    );
  }
}