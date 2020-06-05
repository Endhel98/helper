import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final String message;

  InputField({
    this.hint,
    this.icon,
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
        ),
        decoration: InputDecoration(
          icon: Padding(
            padding: const EdgeInsets.only(top: 35, bottom: 10),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          contentPadding: EdgeInsets.only(
            top: 35,
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
