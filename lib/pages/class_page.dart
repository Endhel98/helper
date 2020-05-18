import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:helper/functionsJson/functions.dart';

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
        backgroundColor: Colors.white,
        child: Icon(
          Icons.save,
          color: Colors.lightBlue,
          size: 30,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextFormField(
                  controller: _classController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Informe o nome da Disciplina!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.school,
                      color: Colors.lightGreen,
                    ),
                    hintText: "Disciplina",
                    hintStyle: TextStyle(fontSize: 20),
                    fillColor: Colors.grey[100],
                    filled: true,
                    border: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextFormField(
                  controller: _professorController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Informe o nome do Professor!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person_pin,
                      color: Colors.red,
                    ),
                    hintText: "Professor",
                    hintStyle: TextStyle(fontSize: 20),
                    fillColor: Colors.grey[100],
                    filled: true,
                    border: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextFormField(
                  controller: _classRomController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Informe o número da Sala!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.class_,
                      color: Colors.yellow,
                    ),
                    hintText: "Sala",
                    hintStyle: TextStyle(fontSize: 20),
                    fillColor: Colors.grey[100],
                    filled: true,
                    border: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextFormField(
                  controller: _firstHourController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Informe o horário!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.watch_later,
                      color: Colors.purple,
                    ),
                    hintText: "Horário do primeiro dia",
                    hintStyle: TextStyle(fontSize: 20),
                    fillColor: Colors.grey[100],
                    filled: true,
                    border: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextFormField(
                  controller: _secondHourController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Informe o horário!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.watch_later,
                      color: Colors.orange,
                    ),
                    hintText: "Horário do segundo dia",
                    hintStyle: TextStyle(fontSize: 20),
                    fillColor: Colors.grey[100],
                    filled: true,
                    border: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
