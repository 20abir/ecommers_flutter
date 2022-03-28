import 'package:ecommers_flutter/LogIn/login.dart';
import 'package:ecommers_flutter/SignUp/Componant/componants.dart';
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
                    Text_form(
                      userName: 'User Name',
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
                    Text_form(
                      validator: (value) {
                        if (value == "") {
                          return 'Please enter your Email';
                        } else if (!regExp.hasMatch(value!)) {
                          return 'Please enter a valid Email';
                        } else {
                          return null;
                        }
                      },
                      userName: 'Email',
                    ),
                    TextFormField(
                      obscureText: obscureText,
                      validator: (value) {
                        if (value == "") {
                          return 'Please enter your Password';
                        } else if (value!.length < 8) {
                          return 'Password must be at least 8 characters';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                            FocusScope.of(context).unfocus();
                          },
                          child: Icon(
                              obscureText == true
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black),
                        ),
                        labelStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text_form(
                      validator: (value) {
                        if (value == "") {
                          return 'Please enter your Phone Number';
                        } else if (value!.length < 11) {
                          return 'Phone Number must be at least 11 characters';
                        } else {
                          return null;
                        }
                      },
                      userName: 'PhoneNumber',
                    ),
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          validation();
                        },
                        child: const Text('Register'),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const Text("I Have Already an Account"),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => const Login(),
                        ),
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
