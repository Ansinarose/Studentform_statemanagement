

// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:image_picker/image_picker.dart';

// class StudentController extends GetxController {
//   var imagePath = ''.obs;
//   var validateName = false.obs;
//   var validateAge = false.obs;
//   var validateContact = false.obs;
//   var validateRollNumber = false.obs;

  
//   var isImagePickerActive = false;

//   void clearImage() {
//     imagePath.value = '';
//   }
//   void refresh() {
//     update();
//      // This will notify any listening widgets to rebuild
//   }

// Future<void> pickImageFromGallery() async {
//   try {
//     final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (returnImage != null) {
//       imagePath.value = returnImage.path;
//     }
//   } catch (e) {
//     print('Error picking image from gallery: $e');
//   }
// }

// Future<void> pickImageFromCamera() async {
//   try {
//     final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
//     if (returnImage != null) {
//       imagePath.value = returnImage.path;
//     }
//   } catch (e) {
//     print('Error picking image from camera: $e');
//   }
// }
// }



import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentlist_statemanagement/Model/modelclass.dart';

class StudentController extends GetxController {
   var students = <Student>[].obs;
  var imagePath = ''.obs;
  var validateName = false.obs;
  var validateAge = false.obs;
  var validateContact = false.obs;
  var validateRollNumber = false.obs;

  
  var isImagePickerActive = false;

  void clearImage() {
    imagePath.value = '';
  }
  void refresh() {
    update();
     // This will notify any listening widgets to rebuild
  }

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

