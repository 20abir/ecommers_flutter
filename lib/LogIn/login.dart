import 'package:ecommers_flutter/SignUp/signUp.dart';
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

bool observeText = true;

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
                    TextFormField(
                      validator: (value) {
                        if (value == "") {
                          return 'Please enter Email';
                        } else if (!regExp.hasMatch(value!)) {
                          return 'Please enter valid Email';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextFormField(
                        obscureText: observeText,
                        validator: (value) {
                          if (value == "") {
                            return 'Please enter Password';
                          } else if (value!.length < 8) {
                            return 'Password must be atleast 8 characters';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                observeText = !observeText;
                              });
                            },
                            child: Icon(
                                observeText == true
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black),
                          ),
                        )),
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          validation();
                        },
                        child: const Text('Login'),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const Text("I Have Not Account"),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => const SignUp(),
                        ),
                      );
                    },
                    child: const Text(
                      "SignUp",
                      style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 20,
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
