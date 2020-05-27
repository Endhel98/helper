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
      padding: EdgeInsets.only(top: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(32),
        ),
        child: TextFormField(
          controller: controller,
          validator: (value) {
            if (value.isEmpty) {
              return message;
            }
            return null;
          },
          decoration: InputDecoration(
            icon: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Icon(
                icon,
                color: color,
              ),
            ),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 16),
            fillColor: Colors.blue[50],
            border: InputBorder.none,
          ),
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
