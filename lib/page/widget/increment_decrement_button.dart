import 'package:flutter/material.dart';

class IncrementDecrementButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  IncrementDecrementButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black, size: 15),
        onPressed: onPressed,
      ),
    );
  }
}
