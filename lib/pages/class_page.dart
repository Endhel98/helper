import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:helper/functionsJson/functions.dart';
import 'package:helper/widgets/textfield_classPage.widget.dart';

class ClassPage extends StatefulWidget {
  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  final _classController = TextEditingController();
  final _professorController = TextEditingController();
  final _classRomController = TextEditingController();
  final _firstHourController = TextEditingController();
  final _secondHourController = TextEditingController();
  List _toDoList = [];
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _classController.text = "";

    readData().then((data) {
      setState(() {
        _toDoList = json.decode(data);
      });
    });
  }

  void _addToDo() {
    setState(() {
      Map<String, dynamic> newToDo = Map();
      newToDo["class"] = _classController.text;
      newToDo["professor"] = _professorController.text;
      newToDo["classRom"] = _classRomController.text;
      newToDo["firstHour"] = _firstHourController.text;
      newToDo["secondHour"] = _secondHourController.text;
      newToDo["absenses"] = 0;
      _toDoList.add(newToDo);
      saveData(_toDoList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent.withOpacity(0.2),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _addToDo();
            Navigator.pop(context, _toDoList);
          }
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: Icon(
          Icons.save,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFieldClassPage(
                controller: _classController,
                message: "Informe o nome da Disciplina!",
                labelText: "Disciplina",
              ),
              TextFieldClassPage(
                controller: _professorController,
                message: "Informe o nome do Professor!",
                labelText: "Professor",
              ),
              TextFieldClassPage(
                controller: _classRomController,
                message: "Informe o número da Sala!",
                labelText: "Sala",
              ),
              TextFieldClassPage(
                controller: _firstHourController,
                message: "Informe o horário!",
                labelText: "Horário do primeiro dia",
              ),
              TextFieldClassPage(
                controller: _secondHourController,
                message: "Informe o horário!",
                labelText: "Horário do segundo dia",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
