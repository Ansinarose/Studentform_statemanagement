import 'package:flutter/material.dart';

// ignore: camel_case_types
class NameScreen extends StatelessWidget {
  const NameScreen({super.key, 
  required this.validateName,
  required this.userNameController});
 

 final TextEditingController userNameController;
 final bool validateName;
 
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if(value == null || value.isEmpty){
          return "Name is required for this";    
        }
        return null;
      },
      controller: userNameController,
      decoration: InputDecoration(                   
        prefixIcon: const Icon(Icons.person),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green, width: 1,
          ),
          borderRadius:
         BorderRadius.all(Radius.circular(15))
        ),
        border:  const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        labelText: "Name",
        errorText: validateName ? 'Name is not found' : null,
      ),
    );
  }
}