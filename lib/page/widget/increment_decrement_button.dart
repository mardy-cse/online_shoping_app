import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int _quantity = 1;

  void _increment() {
    setState(() {
      _quantity++;
    });
  }

  void _decrement() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              color: Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(10)
          ),
          child: IconButton(
            icon: Icon(Icons.remove,color: Colors.black,size: 15,),
            onPressed: _decrement,
          ),
        ),
        SizedBox(width: 10,),
        Text(
          '$_quantity',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(width: 10,),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              color: Color(0xffDB3022),
              borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: IconButton(
              icon: Icon(Icons.add, color: Colors.white,size: 15,),
              onPressed: _increment,
            ),
          ),
        ),
      ],
    );
  }
}