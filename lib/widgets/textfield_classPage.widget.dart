import 'package:flutter/material.dart';

class TextFieldClassPage extends StatelessWidget {
  final controller;
  final message;
  final hintText;
  final icon;
  final color;

  TextFieldClassPage({
    @required this.controller,
    @required this.message,
    @required this.hintText,
    @required this.color,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value.isEmpty) {
            return message;
          }
          return null;
        },
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: color,
          ),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 20),
          fillColor: Colors.grey[100],
          filled: true,
          border: InputBorder.none,
        ),
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
