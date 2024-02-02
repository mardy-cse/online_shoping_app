import 'package:flutter/material.dart';
import '../material/color.dart';
class CustomFormField extends StatefulWidget {
  final String text;

  CustomFormField({
    required this.text
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius:2,
              spreadRadius: 1,
            )
          ]
      ),
      child: TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide.none
            ),
            labelText: widget.text,
            labelStyle: TextStyle(
              color: colorGrey,
              fontWeight: FontWeight.bold,
            )
        ),
      ),
    );
  }
}
