import 'package:flutter/material.dart';
import 'increment_decrement_button.dart';

class CartProduct extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final double price;
  final VoidCallback onPressed;

  CartProduct({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 100,
                  width: 100,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15,),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$$price',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        title,
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 5),
                      Text(
                        subtitle,
                        style: TextStyle(fontSize: 9, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 45),
                  child: QuantitySelector()),
            ],
          ),
          SizedBox(height: 15,),

        ],
      ),
    );

  }
}
