

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class StudentController extends GetxController {
  var imagePath = ''.obs;
   var validateName = false.obs;
  var validateAge = false.obs;
  var validateContact = false.obs;
  var validateRollNumber = false.obs;

 
  

  
Future<void> pickImageFromGallery() async {
  try {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage != null) {
      imagePath.value = returnImage.path;
    }
  } catch (e) {
    print('Error picking image from gallery: $e');
  }
}


  void clearImage(){
    imagePath.value = '';
  }

  
  Future<void> pickImageFromCamera() async {
  try {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage != null) {
      imagePath.value = returnImage.path;
    }
  } catch (e) {
    print('Error picking image from camera: $e');
  }
}

}


// import 'dart:io';

// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// class StudentController extends GetxController {
//   var imagePath = ''.obs;
//   var isNameValid = false.obs;
//   var isAgeValid = false.obs;
//   var isContactValid = false.obs;
//   var isRollNumberValid = false.obs;

//   void validateName(bool value) {
//     isNameValid.value = value;
//   }

//   void validateAge(bool value) {
//     isAgeValid.value = value;
//   }

//   void validateContact(bool value) {
//     isContactValid.value = value;
//   }

//   void validateRollNumber(bool value) {
//     isRollNumberValid.value = value;
//   }

//   Future<void> pickImageFromGallery() async {
//     try {
//       final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
//       if (returnImage != null) {
//         imagePath.value = returnImage.path;
//       }
//     } catch (e) {
//       print('Error picking image from gallery: $e');
//     }
//   }

//   void clearImage() {
//     imagePath.value = '';
//   }

//   Future<void> pickImageFromCamera() async {
//     try {
//       final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
//       if (returnImage != null) {
//         imagePath.value = returnImage.path;
//       }
//     } catch (e) {
//       print('Error picking image from camera: $e');
//     }
//   }
// }

