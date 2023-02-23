import 'package:flutter/material.dart';
import 'package:sendlinks/screens/random_user_profile/other_profile.dart';

import '../../services/models.dart';

class MyCard extends StatelessWidget {


  const MyCard({required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) =>
                OtherUserProfileScreen(user: user),
          ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width/1.8,
        height: MediaQuery.of(context).size.height/3,
        margin: EdgeInsets.only(bottom: 3, right: 4, top: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.05),
                blurRadius: 5,
                spreadRadius: 5)
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              user.pfp_url == ""? Image.asset(
                'images/img2.jpg',
                fit: BoxFit.cover,
                //width: Image.asset("images/img2.png").width,
                //height: Image.asset("images/img2.png").height,
              ): Image.network(user.pfp_url, fit: BoxFit.cover),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.blueAccent.shade700.withOpacity(.9)
                        ])),
                child: Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'x',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    // return GestureDetector(
    //   onTap: (){
    //     Navigator.of(context).push(
    //       MaterialPageRoute(
    //         builder: (BuildContext context) =>
    //             OtherUserProfileScreen(user: user),
    //       ),
    //     );// new screen that show new info
    //   },
    //   child: Container(
    //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0),
    //       gradient: LinearGradient(
    //         begin: Alignment.topRight,
    //         end: Alignment.bottomLeft,
    //         colors: [
    //           Colors.white54,
    //           Colors.blueAccent.shade200,
    //         ],
    //       ),
    //     ),
    //     child: Column(
    //       children: [
    //         SizedBox(
    //           height: 15.0,
    //         ),
    //         CircleAvatar(
    //           backgroundImage: NetworkImage(user.pfp_url != ""? user.pfp_url: 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/5/5a/Satoru_Gojo_arrives_on_the_battlefield_%28Anime%29.png/revision/latest?cb=20210226205256'),
    //           radius: 100,
    //         ),
    //         SizedBox(
    //           height: 15.0,
    //         ),
    //         Container(
    //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0),
    //             gradient: LinearGradient(
    //               begin: Alignment.topRight,
    //               end: Alignment.bottomLeft,
    //               colors: [
    //                 Colors.white54,
    //                 Colors.blueAccent.shade200,
    //               ],
    //             ),
    //           ),
    //           child: Padding(
    //             padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Icon(Icons.star_border_outlined, color: Colors.white, size: 50),
    //                 Column(
    //                   children: [
    //                     Text(user.name.toUpperCase(), style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.w500), ),
    //                   ],
    //                 ),
    //                 Icon(Icons.star_border_outlined, color: Colors.white, size: 50,),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ]
    //     ),
    //   ),
    // );
  }
}