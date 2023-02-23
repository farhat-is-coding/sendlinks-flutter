import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.star,
            size: 20,
          ),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.supervised_user_circle,
            size: 20,
          ),
          label: 'Edit',
        ),
      ],
      fixedColor: Colors.deepPurple[200],
      onTap: (int idx) {
        switch (idx) {
          case 0:
          // do nothing
            break;
          case 1:
            Navigator.pushNamed(context, '/edit');
            break;
        }
      },
    );
  }
}