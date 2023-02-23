// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sendlinks/constants.dart';
import 'package:sendlinks/shared/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sendlinks/services/auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email="", password="";
  bool saving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,

      body: ModalProgressHUD(
        inAsyncCall: saving,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 200.0,
                  child: Image.asset('images/img.png'),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter Email',
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter Password',
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(color: Colors.lightBlueAccent, title: 'Log In', onPressed: () async {
                  await AuthService().emailLogin(email, password);
                  Navigator.pop(context);
                  },)
              ],
            ),
          ),
      ),
    );
  }
}
