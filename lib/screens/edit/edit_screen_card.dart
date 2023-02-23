import 'package:flutter/material.dart';

import '../../services/auth.dart';
import '../../services/firestore.dart';
import '../../services/storage.dart';
import 'edit_screen_row.dart';

class EditCard extends StatefulWidget {
  EditCard({
    Key? key,
    required this.title,
    this.color = const Color(0xFF80A4FF),
    this.iconSrc = "images/img.jpg",
  }) : super(key: key);

  final String title, iconSrc;
  final Color color;

  @override
  State<EditCard> createState() => _EditCardState();
}

class _EditCardState extends State<EditCard> {
  String social = "", username = "";

  String? img = AuthService().user?.photoURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      height: MediaQuery.of(context).size.height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 6, right: 8),
              child: Column(
                children: [
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w900,fontSize: 27),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      img = (await StorageService().selectFile())!;
                      img == "" ? null : setState(() {});
                    },
                    child: Container(
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: img != null
                            ? NetworkImage(img!)
                            : AssetImage('images/img.png') as ImageProvider,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 8),
                    child: TextField(
                      onChanged: (s) => social = s,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      decoration: InputDecoration(
                        hintStyle:
                        TextStyle(fontSize: 18.0, color: Colors.black),
                        hintText: "Social Media Platform",
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                        prefixIcon: Icon(
                          Icons.star,
                          size: 25,
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 8),
                    child: TextField(
                      onChanged: (s) => username = s,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      decoration: InputDecoration(
                        hintText: "Your Username",
                        hintStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                        prefixIcon: Icon(
                          Icons.star,
                          color: Colors.black,
                          size: 25,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),),
                      ),

                    ),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () async {
                      await FirestoreService().addSocial(social, username);
                      Navigator.pushNamedAndRemoveUntil(context, '/profile', (route) => false);
                    },
                    child: ESRow(title: 'Add Up        ', colorl: Colors.blueAccent.shade100),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () async {
                      Navigator.pushNamed(context, '/home',);
                    },
                    child: ESRow(title: 'Home Page', colorl: Colors.orangeAccent.shade100,),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () async {
                      await AuthService().signOut();
                      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                    },
                    child: ESRow(title: 'Sign Out     ',colorl: Colors.pinkAccent.shade100),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
