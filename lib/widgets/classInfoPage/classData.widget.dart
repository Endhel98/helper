import 'package:flutter/material.dart';
import 'package:helper/widgets/classInfoPage/fieldTitle.widget.dart';
import 'package:helper/widgets/classPage/inputField.dart';

class ClassData extends StatelessWidget {
  final professorController;
  final emailController;
  final attendanceRoomController;
  final classRomController;
  final firstHourController;
  final secondHourController;
  final classController;

  ClassData({
    @required this.classController,
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
        FieldTitle(title: "Disciplina"),
        InputField(
          label: "Nome",
          controller: classController,
          message: "Informe o nome da Disciplina!",
        ),
        SizedBox(
          height: 30,
        ),
        FieldTitle(title: "Professor"),
        InputField(
          label: "Nome",
          controller: professorController,
        ),
        InputField(
          label: "Email",
          controller: emailController,
        ),
        InputField(
          label: "Sala",
          controller: attendanceRoomController,
        ),
        SizedBox(
          height: 30,
        ),
        FieldTitle(title: "Sala"),
        InputField(
          label: "Num",
          controller: classRomController,
        ),
        SizedBox(
          height: 30,
        ),
        FieldTitle(title: "Horário"),
        InputField(
          label: "1º Dia",
          controller: firstHourController,
        ),
        InputField(
          label: "2º Dia",
          controller: secondHourController,
        ),
      ],
    );
  }
}
