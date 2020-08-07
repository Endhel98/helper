import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  final String info;
  final IconData icon;
  final Color color;
  final bool isClassField;

  Information({
    @required this.info,
    @required this.color,
    @required this.icon,
    @required this.isClassField,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          Container(
            width: 275.0,
            child: Text(
              info,
              style: isClassField
                  ? TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    )
                  : TextStyle(
                      fontSize: 16.0,
                      color: Colors.white70,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
