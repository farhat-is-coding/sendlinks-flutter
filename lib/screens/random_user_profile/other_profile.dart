// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import '../../shared/socials_row.dart';
import '../../services/models.dart';
import '../../shared/bottom_nav.dart';


class OtherUserProfileScreen extends StatelessWidget {

  OtherUserProfileScreen({required this.user});
  final User user;

  List<MaterialColor> colors = [Colors.red,
    Colors.pink, Colors.blue, Colors.lime, Colors.grey];

  @override
  Widget build(BuildContext context) {
    List<Widget> UserSocials  = [];
    int idx = 0;
    user.socials.forEach((key, value) {
      // log(key);
      // log(value);
      UserSocials.add(SocialAppRow(title: key, colorl: colors[idx],subtitle: value, ) );
      UserSocials.add(SizedBox(height: 10),);
      idx = (idx+1)%colors.length;
    });


      return Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.2, 0.8, 0.9,],
              colors: [Colors.deepPurpleAccent.shade700, Colors.blue, Colors.deepPurpleAccent.shade700,],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(backgroundImage: user.pfp_url != ""?  NetworkImage(user.pfp_url)
                      :AssetImage('images/img2.jpg') as ImageProvider,
                      radius: 80),
                  SizedBox(height: 5),
                  Text(user.name.toString().toUpperCase(), style: TextStyle(fontSize: 30, color: Colors.white,fontWeight: FontWeight.w900),),
                  SizedBox(height: 10),
                  Column(
                    children: UserSocials,
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }
}
