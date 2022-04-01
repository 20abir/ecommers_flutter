import 'package:flutter/material.dart';

class MyTextFormFeild extends StatelessWidget {
  FormFieldValidator<String> validator;
  final String name;

  MyTextFormFeild({
    Key? key,
    required this.validator,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: name,
        labelStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
