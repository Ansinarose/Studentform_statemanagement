// ignore_for_file: unused_import, unnecessary_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class ContactScreen extends StatelessWidget {
  
 
 final TextEditingController userContactController;
  final bool validateContact ;
  final bool editname;
   ContactScreen({super.key,
   required this.userContactController,
   required this.validateContact, 
   required this.editname});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction ,
      validator: (value) {
        if(value ==null || value.isEmpty){
          return 'Contact Number is required';

        }
        return null;
      },
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10)
      ],
      controller: userContactController,
      decoration:  InputDecoration(
        prefixIcon:  Icon(Icons.contacts),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green, width: 1,
          ),
          borderRadius:
         BorderRadius.all(Radius.circular(15))
        ),
         border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                                 labelText: "Contact",
                                  errorText:editname && validateContact ? 'Contact Not Found !' : null,
      ),
       
    );
  }
}