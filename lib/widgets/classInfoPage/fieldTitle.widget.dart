import 'package:flutter/material.dart';

class FieldTitle extends StatelessWidget {
  final String title;

  FieldTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.white.withOpacity(0.2),
      ),
      height: 27,
      alignment: Alignment(0, 0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white70,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
