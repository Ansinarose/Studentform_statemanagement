

import 'package:get/get.dart';
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

  Future<void> pickImageFromGallery() async {
    try {
      final returnImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (returnImage != null) {
        imagePath.value = returnImage.path;
        update(); // Notify listeners to rebuild the UI
      }
    } catch (e) {
      print('Error picking image from gallery: $e');
    }
  }

  Future<void> pickImageFromCamera() async {
    try {
      final returnImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (returnImage != null) {
        imagePath.value = returnImage.path;
        update(); // Notify listeners to rebuild the UI
      }
    } catch (e) {
      print('Error picking image from camera: $e');
    }
  }
}
