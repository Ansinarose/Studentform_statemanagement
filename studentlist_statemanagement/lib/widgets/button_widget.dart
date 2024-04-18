import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, 
 required this.userNameController,
 required this.userAgeController, 
 required this.userContactController,
 required this.userRollNumberController});

final TextEditingController userNameController;
final TextEditingController userAgeController;
  final TextEditingController userContactController;
  final TextEditingController userRollNumberController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
       style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green)),
      onPressed: (){
       
      },
       child: const Text('Add Student',
       style: TextStyle(
        color: Colors.black
       ),));
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//  import 'package:get/get_connect/http/src/utils/utils.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:studentlist_statemanagement/controller/studentcontroller.dart';
// class ButtonWidget extends StatelessWidget {
//    ButtonWidget({
//     Key? key,
//     required this.userNameController,
//     required this.userAgeController,
//     required this.userContactController,
//     required this.userRollNumberController,
//   }) : super(key: key);

//   final TextEditingController userNameController;
//   final TextEditingController userAgeController;
//   final TextEditingController userContactController;
//   final TextEditingController userRollNumberController;

// bool validateName = false;
//   bool validateAge = false;
//   bool validateContact = false;
//   bool validateRollNumber = false;



//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ButtonStyle(
//         backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
//       ),
//       onPressed: () {
//         bool isValid = _validateFields();
//         if (isValid) {
//           // Proceed to add student
//         } else {
//           // Show error message or handle invalid fields
//         }
//       },
//       child: const Text(
//         'Add Student',
//         style: TextStyle(
//           color: Colors.black,
//         ),
//       ),
//     );
//   }

// bool _validateFields() {
//   bool isValid = true;

//   // Validate image selection
//   final imagePath = Get.find<StudentController>().imagePath.value;
//   if (imagePath == null || imagePath.isEmpty) {
//     // Show error message or handle invalid image selection
//     isValid = false;
//   }

//   // Validate name
//   if (userNameController.text.isEmpty) {
//     Get.find<StudentController>().validateName(true);
//     isValid = false;
//   } else {
//     Get.find<StudentController>().validateName(false);
//   }

//   // Validate age
//   if (userAgeController.text.isEmpty) {
//     Get.find<StudentController>().validateAge(true);
//     isValid = false;
//   } else {
//     Get.find<StudentController>().validateAge(false);
//   }

//   // Validate contact
//   if (userContactController.text.isEmpty) {
//     Get.find<StudentController>().validateContact(true);
//     isValid = false;
//   } else {
//     Get.find<StudentController>().validateContact(false);
//   }

//   // Validate roll number
//   if (userRollNumberController.text.isEmpty) {
//     Get.find<StudentController>().validateRollNumber(true);
//     isValid = false;
//   } else {
//     Get.find<StudentController>().validateRollNumber(false);
//   }

//   return isValid;
// }

// }
