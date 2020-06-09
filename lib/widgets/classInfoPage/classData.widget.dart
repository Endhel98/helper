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
          height: 15,
        ),
        FieldTitle(title: "Professor"),
        InputField(
          label: "Nome",
          controller: professorController,
          message: "Informe o nome do Professor!",
        ),
        InputField(
          label: "Email",
          controller: emailController,
        ),
        InputField(
          label: "Sala",
          controller: attendanceRoomController,
        ),
        Divider(color: Colors.transparent),
        FieldTitle(title: "Sala"),
        InputField(
          label: "Num",
          controller: classRomController,
          message: "Informe o número da Sala!",
        ),
        Divider(color: Colors.transparent),
        FieldTitle(title: "Horário"),
        InputField(
          label: "1º Dia",
          controller: firstHourController,
          message: "Informe o 1º Horário!",
        ),
        InputField(
          label: "2º Dia",
          controller: secondHourController,
          message: "Informe o 2º Horário!",
        ),
      ],
    );
  }
}
