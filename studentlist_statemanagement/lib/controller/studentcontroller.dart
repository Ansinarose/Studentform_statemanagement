

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class StudentController extends GetxController {
  var imagePath = ''.obs;
  var validateName = false.obs;
  var validateAge = false.obs;
  var validateContact = false.obs;
  var validateRollNumber = false.obs;

  // Flag to check if image picker is active
  var isImagePickerActive = false;

  // Future<void> pickImageFromGallery() async {
  //   try {
  //     if (!isImagePickerActive) {
  //       isImagePickerActive = true; // Set flag to true
  //       final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
  //       if (returnImage != null) {
  //         imagePath.value = returnImage.path;
  //       }
  //       isImagePickerActive = false; // Reset flag
  //     }
  //   } catch (e) {
  //     isImagePickerActive = false; // Reset flag even if an error occurs
  //     print('Error picking image from gallery: $e');
  //     // Display a message to the user
  //     // You can use Get.snackbar or showDialog to display the message
  //   }
  // }

  void clearImage() {
    imagePath.value = '';
  }
  void refresh() {
    update();
     // This will notify any listening widgets to rebuild
  }
//   Future<void> pickImageFromCamera() async {
//     try {
//       if (!isImagePickerActive) {
//         isImagePickerActive = true; // Set flag to true
//         final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
//         if (returnImage != null) {
//           imagePath.value = returnImage.path;
//         }
//         isImagePickerActive = false; // Reset flag
//       }
//     } catch (e) {
//       isImagePickerActive = false; // Reset flag even if an error occurs
//       print('Error picking image from camera: $e');
//       // Display a message to the user
//       // You can use Get.snackbar or showDialog to display the message
//     }
//   }
// }
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