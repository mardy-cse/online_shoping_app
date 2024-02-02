import 'package:flutter/material.dart';
import 'package:online_shoping_app/page/widget/elevated_button.dart';
import 'package:online_shoping_app/page/widget/product_item.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Hello John', style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 28,
                  width: 95,
                  child: CustomElevatedButton(
                    buttonText: 'Logout',
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },),
                )
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProductCard(
                  imagePath: 'assets/img/black_headPhone.png',
                  title: 'SONY Premium\nWireless Headphones',
                  subtitle: 'Model: WH-1000XM4, Black',
                  price: 19.99,
                  onPressed: () {
                    // Handle button press
                  },
                ),
                ProductCard(
                  imagePath: 'assets/img/white headphone.png',
                  title: 'SONY Premium\nWireless Headphones',
                  subtitle: 'Model: WH-1000XM4, Black',
                  price: 19.99,
                  onPressed: () {
                    // Handle button press
                  },
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProductCard(
                  imagePath: 'assets/img/image 12 (1).png',
                  title: 'SONY Premium\nWireless Headphones',
                  subtitle: 'Model: WH-1000XM4, Black',
                  price: 19.99,
                  onPressed: () {
                    // Handle button press
                  },
                ),
                ProductCard(
                  imagePath: 'assets/img/image 9.png',
                  title: 'SONY Premium\nWireless Headphones',
                  subtitle: 'Model: WH-1000XM4, Black',
                  price: 19.99,
                  onPressed: () {
                    // Handle button press
                  },
                ),
              ],
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }




}
