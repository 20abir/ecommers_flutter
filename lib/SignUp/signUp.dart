import 'package:ecommers_flutter/LogIn/login.dart';
import 'package:ecommers_flutter/widget/changescreen.dart';
import 'package:ecommers_flutter/widget/myButton.dart';
import 'package:ecommers_flutter/widget/myTextFormField.dart';
import 'package:ecommers_flutter/widget/passwordFormField.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

// ignore: unnecessary_new
RegExp regExp = new RegExp(p);

bool obscureText = true;

class _SignUpState extends State<SignUp> {
  void validation() {
    final FormState? _form = _formKey.currentState;

    if (_form!.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 220,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 400,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyTextFormFeild(
                      name: 'User Name',
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'User Name must be at least 6 characters';
                        } else if (value.length > 15) {
                          return 'User Name must be less than 15 characters';
                        } else if (value == "") {
                          return 'Please enter your User Name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    MyTextFormFeild(
                      validator: (value) {
                        if (value == "") {
                          return 'Please enter your Email';
                        } else if (!regExp.hasMatch(value!)) {
                          return 'Please enter a valid Email';
                        } else {
                          return null;
                        }
                      },
                      name: 'Email',
                    ),
                    PasswordFormField(
                      obsertext: obsertext,
                      name: 'Password',
                      validator: (value) {
                        if (value == "") {
                          return 'Please enter your Password';
                        } else if (value!.length < 8) {
                          return 'Password must be at least 8 characters';
                        } else {
                          return null;
                        }
                      },
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                        FocusScope.of(context).unfocus();
                      },
                    ),
                    MyTextFormFeild(
                      validator: (value) {
                        if (value == "") {
                          return 'Please enter your Phone Number';
                        } else if (value!.length < 11) {
                          return 'Phone Number must be at least 11 characters';
                        } else {
                          return null;
                        }
                      },
                      name: 'PhoneNumber',
                    ),
                    MyButton(
                      onPressed: () {
                        validation();
                      },
                      name: 'Sign Up',
                    ),
                  ],
                ),
              ),
              ChangeScreen(
                name: "Login",
                wichAccount: "Already have an account?",
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => const Login(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
