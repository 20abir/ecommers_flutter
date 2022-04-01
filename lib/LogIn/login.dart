import 'package:ecommers_flutter/SignUp/signUp.dart';
import 'package:ecommers_flutter/widget/changescreen.dart';
import 'package:ecommers_flutter/widget/myButton.dart';
import 'package:ecommers_flutter/widget/myTextFormField.dart';
import 'package:ecommers_flutter/widget/passwordFormField.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

// ignore: unnecessary_new
RegExp regExp = new RegExp(p);
void validation() {
  final FormState? _form = _formKey.currentState;

  if (_form!.validate()) {
    print('Form is valid');
  } else {
    print('Form is invalid');
  }
}

bool obsertext = true;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    MyTextFormFeild(
                      name: "Email",
                      validator: (value) {
                        if (value == "") {
                          return 'Please enter Email';
                        } else if (!regExp.hasMatch(value!)) {
                          return 'Please enter valid Email';
                        }
                        return null;
                      },
                    ),
                    PasswordFormField(
                      name: 'Password',
                      obsertext: obsertext,
                      validator: (value) {
                        if (value == "") {
                          return 'Please enter Password';
                        } else if (value!.length < 8) {
                          return 'Password must be atleast 8 characters';
                        }
                        return null;
                      },
                      onTap: () {
                        setState(() {
                          obsertext = !obsertext;
                        });
                      },
                    ),
                  ],
                ),
              ),

              //button

              MyButton(
                onPressed: () {
                  validation();
                },
                name: 'Login',
              ),
              const SizedBox(height: 15),

              ChangeScreen(
                name: "SignUp",
                wichAccount: "I don't have an account",
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => const SignUp(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
