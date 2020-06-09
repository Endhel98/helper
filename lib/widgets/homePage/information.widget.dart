import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  final info;
  final icon;
  final color;
  final isClassField;

  Information({
    @required this.info,
    @required this.color,
    @required this.icon,
    @required this.isClassField,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5, top: 5),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          Container(
            width: 275,
            child: Text(
              info,
              style: isClassField
                  ? TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    )
                  : TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
