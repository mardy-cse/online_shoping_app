import 'dart:async';
import 'package:flutter/material.dart';
import 'package:online_shoping_app/page/page_route.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context)=>PageRouting()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Image.asset('assets/img/Group 33574.png', fit: BoxFit.fill,),
          ),
          Center(
            child: Image.asset('assets/img/H.png'),
          ),
        ],
      ),
    );
  }
}
