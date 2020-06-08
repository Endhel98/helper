import 'package:flutter/material.dart';

class FieldTitle extends StatelessWidget {
  final String title;

  FieldTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.15),
      height: 27,
      alignment: Alignment(0, 0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white60,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
