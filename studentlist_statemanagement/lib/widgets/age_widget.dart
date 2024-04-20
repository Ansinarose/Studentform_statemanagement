import 'package:flutter/material.dart';

// ignore: must_be_immutable
class  AgeScreen extends StatelessWidget {
   AgeScreen ({super.key, 
  required this.userAgeController,
  required this.validateAge, required this.editname});

  final TextEditingController userAgeController;
   final bool validateAge ;
final bool editname;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
       autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if(value == null || value.isEmpty){
          return "Age is required";
        }
        return null;
      },
      keyboardType: TextInputType.number,
      controller: userAgeController,
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
        labelText: 'Age',
        errorText: editname && validateAge ?  'Age Not Found' : null,
      ),
      
    );
  }
}