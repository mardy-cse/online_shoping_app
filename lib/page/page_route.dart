import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_shoping_app/page/bottom_navbar.dart';
import 'package:online_shoping_app/page/signup_page.dart';

class PageRouting extends StatefulWidget {
  const PageRouting({Key? key}) : super(key: key);

  @override
  State<PageRouting> createState() => _PageRoutingState();
}

class _PageRoutingState extends State<PageRouting> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return BottomNavBar();
        } else {
          return SignUpScreen();
        }
      },
    ));
  }
}
