// ignore_for_file: avoid_print, file_names, import_of_legacy_library_into_null_safe, unnecessary_new, sized_box_for_whitespace, prefer_const_constructors, unused_element

import 'package:flutter/material.dart';

class LoginPa extends StatefulWidget {
  const LoginPa({Key? key}) : super(key: key);

  @override
  _LoginPaState createState() => _LoginPaState();
}

class _LoginPaState extends State<LoginPa> {
  final _formKey = GlobalKey<FormState>();
  String _userEmail = '';
  String _password = '';
  void _trySubmitForm() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      print(_userEmail);
      print(_password);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool _isObsecure = true;
    return Scaffold(
        backgroundColor: Colors.brown[200],
        body: Center(
          child: Column(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.symmetric(
                  vertical: 60.0,
                ),
                child: Image.asset("img/img2.png"),
              ),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              labelText: 'Email',
                              hintText: 'Enter Your Email',
                            ),
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Please enter your email address';
                              }
                              // Check if the entered email has the right format
                              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              // Return null if the entered email is valid
                              return null;
                            },
                            onChanged: (value) => _userEmail = value,
                          ),

                          TextFormField(
                            obscureText: _isObsecure,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              labelText: 'Password',
                              hintText: 'Password',
                            ),
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'This field is required';
                              }
                              if (value.trim().length < 8) {
                                return 'Password must be at least 8 characters in length';
                              }
                              // Return null if the entered password is valid
                              return null;
                            },
                            onChanged: (value) => _password = value,
                          ),
                          const SizedBox(
                            //Use of SizedBox
                            height: 30,
                          ),

                          // ignore: deprecated_member_use
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 14),
                            ),
                            onPressed: _trySubmitForm,
                            child: const Text('Login'),
                          ),
                          const SizedBox(
                            //Use of SizedBox
                            height: 10,
                          ),
                          // ignore: deprecated_member_use
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            onPressed: () {},
                            child: const Text('Forgot Password?'),
                          ),
                        ],
                      ))),
            ],
          ),
        ));
  }
}
