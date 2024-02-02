import 'package:flutter/material.dart';
class Footer extends StatefulWidget {
  final String text;
  final String path1;
  final String path2;

  Footer({
    required this.text,
    required this.path1,
    required this.path2
  });

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(widget.text),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 80,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius:2,
                        spreadRadius: 1,
                      )
                    ]
                ),
                child: Image.asset(widget.path1),
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 80,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius:2,
                        spreadRadius: 1,
                      )
                    ]
                ),
                child: Image.asset(widget.path2),
              ),
            ],
          )
        ],
      ),
    );
  }
}
