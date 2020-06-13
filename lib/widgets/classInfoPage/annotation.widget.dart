import 'package:flutter/material.dart';

class Annotation extends StatelessWidget {
  final TextEditingController controller;

  Annotation({this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 500,
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: TextField(
        maxLines: 100,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: InputBorder.none,
        ),
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}
