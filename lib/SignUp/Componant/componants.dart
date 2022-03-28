import 'package:flutter/material.dart';

class Text_form extends StatelessWidget {
  final userName;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;

  const Text_form({
    Key? key,
    this.suffixIcon,
    required this.userName,
    this.validator,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: userName,
        suffixIcon: suffixIcon,
        labelStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
