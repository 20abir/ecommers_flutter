import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  VoidCallback onPressed;
  final String name;
  MyButton({
    Key? key,
    required this.onPressed,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(name),
      ),
    );
  }
}
