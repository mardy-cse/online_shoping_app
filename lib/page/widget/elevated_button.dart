import 'package:flutter/material.dart';
import 'package:online_shoping_app/page/material/color.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  CustomElevatedButton({
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(buttonText, style: TextStyle(
          color: colorWhite,
      ),),
      style: ElevatedButton.styleFrom(
          backgroundColor: colorOrange,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
          )
      ),
    );
  }
}
