// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'edit_screen_card.dart';

class EditUserInfoScreen extends StatefulWidget {
  static const String id = 'edit_screen';

  @override
  State<EditUserInfoScreen> createState() => _EditUserInfoScreenState();
}

class _EditUserInfoScreenState extends State<EditUserInfoScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade700,
      ),
      drawer: Drawer(
        backgroundColor: Colors.blueAccent.shade700,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text('Welcome!'),
            ),
            ListTile(
              title: const Text('My Profile',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(context, '/profile', (route) => false,);
              },
              leading: Icon(Icons.star_border_outlined,
                  color: Colors.white, size: 40),
            ),
            ListTile(
              title: const Text('Home', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
              leading: Icon(
                Icons.star_border_outlined,
                color: Colors.white,
                size: 40,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              EditCard(title: "Complete your Profile!"),
            ],
          ),
        ),
      ),
    );
  }
}



