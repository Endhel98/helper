import 'package:flutter/material.dart';

class FieldTitle extends StatelessWidget {
  final String title;

  FieldTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurpleAccent.withOpacity(0.15),
      height: 27,
      width: 300,
      alignment: Alignment(0, 0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.deepPurpleAccent,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
