import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sendlinks/shared/rounded_button.dart';
import 'package:sendlinks/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sendlinks/services/auth.dart';
import 'package:sendlinks/services/firestore.dart';


class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email="", password="", name="z";

  bool saving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: ModalProgressHUD(
        inAsyncCall: saving,
        child: Center(
          child: SingleChildScrollView(
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
                      )
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                      style: TextStyle(color: Colors.white),

                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        name = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter Name',
                      )
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
                  RoundedButton(
                      color: Colors.blueAccent,
                      title: 'Register',
                      onPressed: () async {
                        setState((){
                          saving = true;
                        });
                        try{

                          User? user = await AuthService().registerUser(email, password);
                          await user?.updateDisplayName(name);
                          await FirestoreService().addName(name);

                          setState((){
                            saving = false;
                          });
                          Navigator.pop(context);
                        }
                        catch(e){
                          setState((){
                            saving = false;
                          });
                          Fluttertoast.showToast(
                              msg: "${e.toString().split(']')[1]}.",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.lightBlue,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}