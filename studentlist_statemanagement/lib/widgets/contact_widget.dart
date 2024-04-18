import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class ContactScreen extends StatelessWidget {
   ContactScreen({super.key, 
  required this.userContactController,
  required this.validateContact});
 
 final TextEditingController userContactController;
 bool validateContact = false;
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
      decoration: const InputDecoration(
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
      ),
       
    );
  }
}