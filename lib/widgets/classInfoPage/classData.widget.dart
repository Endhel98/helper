import 'package:flutter/material.dart';

class ClassData extends StatelessWidget {
  final professorController;
  final emailController;
  final attendanceRoomController;
  final classRomController;
  final firstHourController;
  final secondHourController;

  ClassData({
    @required this.attendanceRoomController,
    @required this.classRomController,
    @required this.emailController,
    @required this.firstHourController,
    @required this.professorController,
    @required this.secondHourController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.blue[50],
          height: 27,
          width: 300,
          alignment: Alignment(0, 0),
          child: Text(
            "Professor",
            style: TextStyle(
              color: Color(0xff1E90FF),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextFormField(
          controller: professorController,
          validator: (value) {
            if (value.isEmpty) {
              return 'Campo Obrigatório!';
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Nome',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ),
          style: TextStyle(fontSize: 16),
        ),
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Email',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ),
          style: TextStyle(fontSize: 16),
        ),
        TextField(
          controller: attendanceRoomController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Sala',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ),
          style: TextStyle(fontSize: 16),
        ),
        Divider(color: Colors.transparent),
        Container(
          color: Colors.blue[50],
          height: 27,
          width: 300,
          alignment: Alignment(0, 0),
          child: Text(
            "Sala",
            style: TextStyle(
              color: Color(0xff1E90FF),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextFormField(
          controller: classRomController,
          validator: (value) {
            if (value.isEmpty) {
              return 'Campo Obrigatório!';
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Num',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ),
          style: TextStyle(fontSize: 16),
        ),
        Divider(color: Colors.transparent),
        Container(
          color: Colors.blue[50],
          height: 27,
          width: 300,
          alignment: Alignment(0, 0),
          child: Text(
            "Horário",
            style: TextStyle(
              color: Color(0xff1E90FF),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextFormField(
          controller: firstHourController,
          validator: (value) {
            if (value.isEmpty) {
              return 'Campo Obrigatório!';
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                '1º Dia',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ),
          style: TextStyle(fontSize: 16),
        ),
        TextFormField(
          controller: secondHourController,
          validator: (value) {
            if (value.isEmpty) {
              return 'Campo Obrigatório!';
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                '2º Dia',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ),
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
