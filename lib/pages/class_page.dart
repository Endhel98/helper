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
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Color(0xff1E90FF),
          ),
          title: Padding(
            padding: EdgeInsets.only(top: 30),
            child: Image.asset(
              "images/Helper.png",
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.refresh,
                size: 25,
              ),
              onPressed: () {
                _classController.clear();
                _classRomController.clear();
                _firstHourController.clear();
                _secondHourController.clear();
                _professorController.clear();
              },
            )
          ],
        ),
        preferredSize: Size.fromHeight(50),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _addToDo();
            Navigator.pop(context, _toDoList);
          }
        },
        backgroundColor: Color(0xff1E90FF),
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
            children: <Widget>[
              TextFieldClassPage(
                controller: _classController,
                message: "Informe o nome da Disciplina!",
                hintText: "Disciplina",
                color: Colors.lightGreen,
                icon: Icons.school,
              ),
              TextFieldClassPage(
                controller: _professorController,
                message: "Informe o nome do Professor!",
                hintText: "Professor",
                color: Colors.red,
                icon: Icons.person_pin,
              ),
              TextFieldClassPage(
                controller: _classRomController,
                message: "Informe o número da Sala!",
                hintText: "Sala",
                color: Colors.yellow,
                icon: Icons.class_,
              ),
              TextFieldClassPage(
                controller: _firstHourController,
                message: "Informe o horário!",
                hintText: "Horário do primeiro dia",
                color: Colors.purple,
                icon: Icons.watch_later,
              ),
              TextFieldClassPage(
                controller: _secondHourController,
                message: "Informe o horário!",
                hintText: "Horário do segundo dia",
                color: Colors.orange,
                icon: Icons.watch_later,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
