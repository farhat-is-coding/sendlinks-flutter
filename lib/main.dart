import 'package:flutter/material.dart';
import 'package:sendlinks/screens/edit/edit_user_info_screen.dart';
import 'package:sendlinks/screens/home/home_screen.dart';
import 'package:sendlinks/screens/login_screen.dart';
import 'package:sendlinks/screens/random_user_profile/other_profile.dart';
import 'package:sendlinks/screens/user_profile/profile_screen.dart';
import 'package:sendlinks/screens/registration_screen.dart';
import 'package:sendlinks/screens/test.dart';
import 'package:sendlinks/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sendlinks/services/models.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SendLinks());
}

class SendLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // where app starts
      routes: {
        '/': (context) => CheckScreen(), //completed
        '/login': (context) => LoginScreen(), // completed
        '/home': (context) => HomeScreen(), // not completed + one more screen from on click users
        '/profile': (context) =>  ProfileScreen(), //completed
        '/welcome': (context) => WelcomeScreen(), // completed
        '/register': (context) => RegistrationScreen(), // completed
        '/edit': (context)=> EditUserInfoScreen(), //completed
      },
    );
  }
}