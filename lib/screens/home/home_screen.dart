import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:sendlinks/screens/home/my_card.dart';
import 'package:sendlinks/services/firestore.dart';


import 'package:sendlinks/services/models.dart' as x;
import 'package:sendlinks/shared/socials_row.dart';




class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          UsersStream()
        ],
      ),
    );
  }
}

class UsersStream extends StatelessWidget {
  List<dynamic> colors = [Colors.blueAccent.shade700,Colors.cyanAccent.shade700, Colors.pink, Colors.blue, Colors.cyan, Colors.blueGrey,
    Colors.deepPurpleAccent.shade700, ];

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<x.User>>(
      future: FirestoreService().getUsers(), // we have users!!!
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Widget> Users = [];
          List<Widget> socials = [];
          var users = snapshot.data; // farhat/
          int idx = 0 ;
          for(x.User user in users!){
            Users.add(MyCard(user: user,));
            user.socials.forEach((key, value) {
              socials.add(Padding(
                padding: const EdgeInsets.all(8.0),
                child: SocialAppRow(title: key, subtitle: value, userIcon: user.pfp_url, colorl: colors[idx]),
              ));
              idx = (idx + 1) % colors.length;
            });
             //UserSocials.add(SizedBox(height: 15.0));
          }



          return Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text("New Users", style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold, color: Colors.white ),),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: Users),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text("New Links", style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold, color: Colors.white),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: socials),
                  ),
                ],
              ),
            ),
          );
        }// if doesnt have data, we fall back to this shit
        return Expanded(
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blueAccent,
            ),
          ),
        );
      },
    );
  }
}




