import 'package:flutter/material.dart';

class TextFieldClassPage extends StatelessWidget {
  final controller;
  final message;
  final labelText;

  TextFieldClassPage({
    @required this.controller,
    @required this.message,
    @required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.center,
        validator: (value) {
          if (value.isEmpty) {
            return message;
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurpleAccent,
          ),
          fillColor: Colors.deepPurpleAccent.withOpacity(0.15),
          filled: true,
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2),
          ),
          errorStyle: TextStyle(color: Colors.deepPurpleAccent),
        ),
        style: TextStyle(fontSize: 14, color: Colors.white),
      ),
    );
  }
}
