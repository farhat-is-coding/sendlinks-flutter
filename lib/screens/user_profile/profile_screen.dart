// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sendlinks/services/auth.dart';
import 'dart:developer';

import '../../shared/socials_row.dart';
import '../../services/firestore.dart';
import '../../services/models.dart';
import '../../shared/bottom_nav.dart';


class ProfileScreen extends StatefulWidget {

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  List<MaterialColor> colors = [Colors.pink, Colors.blue, Colors.cyan, Colors.blueGrey,
      Colors.deepPurple, ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: FirestoreService().getCurrentUser(), // we have users!!!
        builder: (context, snapshot){
          if (snapshot.hasData){
            int idx = 0;
            List<Widget> UserSocials = [];
            var socials = snapshot.data; // farhat/
            log(socials!.name);
            log(socials!.pfp_url);
            log(socials!.socials.toString());

            socials!.socials.forEach((key, value) {
              UserSocials.add(SocialAppRow(title: key, colorl: colors[idx],subtitle: value, ) );
              UserSocials.add(SizedBox(height: 10),);
              idx = (idx+1)%colors.length;
            });

            return Scaffold(
              backgroundColor: Colors.blue,
              bottomNavigationBar: BottomNavBar(),
              body: Container(
                //add width and height to infinity
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.2, 0.8, 0.9,],
                    colors: [Colors.deepPurpleAccent.shade700, Colors.blue, Colors.cyan,],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(backgroundImage: socials.pfp_url != ""?  NetworkImage(socials.pfp_url)
                            :AssetImage('images/img2.jpg') as ImageProvider,
                            radius: 80),
                        SizedBox(height: 5),
                        Text(socials.name.toString().toUpperCase(), style: TextStyle(fontSize: 30, color: Colors.white,fontWeight: FontWeight.w900),),
                        SizedBox(height: 10),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: UserSocials,
                          ),
                        )
                        // Expanded(
                        //   child: ListView(
                        //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        //     children: UserSocials,
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blueAccent,
            ),
          );
        }
    );
  }
}


