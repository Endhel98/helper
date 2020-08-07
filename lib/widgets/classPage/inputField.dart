import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final String message;
  final String label;

  InputField({
    this.label,
    this.hint,
    this.icon,
    this.controller,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          controller: controller,
          validator: (value) {
            if (value.isEmpty) {
              return message;
            }
            return null;
          },
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
          decoration: InputDecoration(
            prefixIcon: label != null
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      label,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white70,
                      ),
                    ),
                  )
                : null,
            icon: hint != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 35.0, bottom: 10.0),
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  )
                : null,
            border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
            ),
            contentPadding: EdgeInsets.only(
              top: 20.0,
              right: 30.0,
              bottom: 10.0,
              left: 5.0,
            ),
            errorStyle: TextStyle(
              color: Colors.red[400],
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
        ),
        Divider(color: Colors.white70),
      ],
    );
  }
}
