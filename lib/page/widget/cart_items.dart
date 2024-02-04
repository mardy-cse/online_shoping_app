import 'package:flutter/material.dart';
import '../model/product.dart';
import 'increment_decrement_button.dart';

class CartProduct extends StatefulWidget {
  final Product product;
  final VoidCallback onRemove;
  CartProduct({required this.product, required this.onRemove});

  @override
  _CartProductState createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  int quantity = 1;

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
                      image: AssetImage(widget.product.imagePath ?? 'assets/placeholder_image.png'),
                      // Use a placeholder image if imagePath is null
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
                        '\$${(double.parse(widget.product.price ?? '0.0') * quantity).toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.product.title ?? 'No title',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 5),
                      Text(
                        widget.product.subtitle ?? 'No subtitle',
                        style: TextStyle(fontSize: 9, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 45),
                child: Row(
                  children: [
                    IncrementDecrementButton(
                      icon: Icons.remove,
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });
                        }else {
                          // Call the onRemove callback when quantity is 1 or less
                          widget.onRemove();
                        }
                      },
                    ),
                    Text(
                      '$quantity',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),

                    IncrementDecrementButton(
                      icon: Icons.add,
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
