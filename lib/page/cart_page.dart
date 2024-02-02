import 'package:flutter/material.dart';
import 'package:online_shoping_app/page/widget/cart_items.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'My Cart',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 40),
              CartProduct(
                imagePath: 'assets/icons/whiteHeadphone.png',
                title: 'SONY Premium\nWireless Headphones',
                subtitle: 'Model: WH-1000XM4, Black',
                price: 19.99,
                onPressed: () {
                  // Handle button press
                },
              ),
              CartProduct(
                imagePath: 'assets/icons/laptop.png',
                title: 'Lenovo Laptop',
                subtitle: 'Model: WH-1000XM4, Black',
                price: 19.99,
                onPressed: () {
                  // Handle button press
                },
              ),
              CartProduct(
                imagePath: 'assets/img/black_headPhone.png',
                title: 'SONY Premium\nWireless Headphones',
                subtitle: 'Model: WH-1000XM4, Black',
                price: 19.99,
                onPressed: () {
                  // Handle button press
                },
              ),
              CartProduct(
                imagePath: 'assets/img/white headphone.png',
                title: 'SONY Premium\nWireless Headphones',
                subtitle: 'Model: WH-1000XM4, Black',
                price: 19.99,
                onPressed: () {
                  // Handle button press
                },
              ),
              CartProduct(
                imagePath: 'assets/img/image 12 (1).png',
                title: 'SONY Premium\nWireless Headphones',
                subtitle: 'Model: WH-1000XM4, Black',
                price: 19.99,
                onPressed: () {
                  // Handle button press
                },
              ),
              Container(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total amount: ', style: TextStyle(
                      color: Colors.grey,
                    ),),
                    Text('1,726.98\$', style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
