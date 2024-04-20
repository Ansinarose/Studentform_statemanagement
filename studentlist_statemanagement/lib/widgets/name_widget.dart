import 'package:flutter/material.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({
    Key? key,
    required this.validateName,
    required this.userNameController, required this.editname,
  }) : super(key: key);

  final TextEditingController userNameController;
  final bool validateName;
  final bool editname;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Name is required";
        }
        return null;
      },
      controller: userNameController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        labelText: "Name",
        errorText: editname && validateName ? 'Name is required' : null, // Modified line
      ),
    );
  }
}
