import 'package:flutter/material.dart';

class Annotation extends StatelessWidget {
  final TextEditingController controller;

  Annotation({this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      width: 500.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(vertical: 20),
      child: TextField(
        maxLines: 100,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: InputBorder.none,
        ),
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
