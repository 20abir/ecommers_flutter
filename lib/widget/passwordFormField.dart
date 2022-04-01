import 'package:flutter/material.dart';

class PasswordFormField extends StatelessWidget {
  bool obsertext;
  FormFieldValidator<String> validator;
  final String name;
  final GestureTapCallback onTap;

  PasswordFormField({
    Key? key,
    required this.obsertext,
    required this.validator,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsertext,
      validator: validator,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: name,
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(
              obsertext == true ? Icons.visibility : Icons.visibility_off,
              color: Colors.black),
        ),
        labelStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
