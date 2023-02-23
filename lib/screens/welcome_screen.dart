// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sendlinks/constants.dart';
import 'package:sendlinks/screens/user_profile/profile_screen.dart';
import 'package:sendlinks/screens/registration_screen.dart';
import '../shared/rounded_button.dart';
import '../services/auth.dart';
import 'edit/edit_user_info_screen.dart';
import 'login_screen.dart';
import 'package:sendlinks/shared/loading.dart';
import 'package:sendlinks/shared/error.dart';

const colorizeColors = [
  Colors.lightBlue,
  Colors.blueAccent,
  Colors.black12,
  Colors.grey,
];

const colorizeTextStyle = TextStyle(
  fontSize: 50.0,
  fontFamily: 'Horizon',
);

class CheckScreen extends StatelessWidget {
  const CheckScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream, // when user changes builder will run again
      builder: (context, snapshot) {
        log('User ${AuthService().user.toString()}');
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loader();
        } else if (snapshot.hasError) {
          return  Center(
            child: ErrorMessage(message: snapshot.error.toString()),
          );
        } else if (snapshot.hasData) { //user is logged in
          return ProfileScreen();
        } else { //user is null
          return WelcomeScreen();
        }
      },
    );
  }
}


class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;


  @override
  void dispose() {
     controller.dispose();
    super.dispose();

  }
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.lightBlueAccent).animate(controller);

    controller.forward();

    animation.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        controller.reverse(from: 5);
      }
      else if(status == AnimationStatus.dismissed){
        controller.forward();
      }
    });

    controller.addListener(() {
      //if(controller.status==)
      setState((){

        //print(animation.value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 60.0,
                  child: Image.asset('images/img.png'),
                ),
                AnimatedTextKit(
                  isRepeatingAnimation: true,
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'Send Links',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                      speed: Duration(milliseconds: 500),

                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(color: Colors.lightBlueAccent, title: 'Log In', onPressed: () {
              Navigator.pushNamed(context,'/login');
            },),
            RoundedButton(color: Colors.blueAccent, title: 'Register', onPressed: (){
              Navigator.pushNamed(context, '/register');
            },),
          ],
        ),
      ),
    );
  }
}


