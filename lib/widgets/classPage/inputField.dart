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
          ),
          decoration: InputDecoration(
            prefixIcon: label != null
                ? Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                    child: Text(
                      label,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                  )
                : null,
            icon: hint != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 35, bottom: 10),
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
              fontSize: 15,
            ),
            contentPadding: EdgeInsets.only(
              top: 20,
              right: 30,
              bottom: 10,
              left: 5,
            ),
            errorStyle: TextStyle(
              color: Colors.red,
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
