import 'package:flutter/material.dart';

class ChangeScreen extends StatelessWidget {
  final String wichAccount;
  final GestureTapCallback onTap;
  final String name;

  const ChangeScreen(
      {Key? key,
      required this.wichAccount,
      required this.onTap,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(wichAccount),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.cyan,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
