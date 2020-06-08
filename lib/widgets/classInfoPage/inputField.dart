import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String message;

  InputField({
    this.label,
    this.controller,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white12,
            width: 0.8,
          ),
        ),
      ),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value.isEmpty) {
            return message;
          }
          return null;
        },
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.2,
        ),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(
            top: 20,
            right: 30,
            bottom: 10,
            left: 5,
          ),
          errorStyle: TextStyle(
            color: Colors.white.withOpacity(0.5),
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
