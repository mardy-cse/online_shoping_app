import 'package:flutter/material.dart';
import 'package:online_shoping_app/page/splash_screen.dart';
void main()=>runApp(OnlineShopingApp());
class OnlineShopingApp extends StatelessWidget {
  const OnlineShopingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Shoping App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
