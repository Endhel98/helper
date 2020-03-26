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

  @override
  void initState() {
    super.initState();

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
      _toDoList.add(newToDo);
      saveData(_toDoList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.lightBlue),
        title: Text(
          "Dados da Disciplina",
          style: TextStyle(color: Colors.lightBlue),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addToDo();
          Navigator.pop(context, _toDoList);
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
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextField(
                controller: _classController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.school,
                    color: Colors.lightGreen,
                  ),
                  hintText: "Disciplina",
                  hintStyle: TextStyle(fontSize: 20),
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextField(
                controller: _professorController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person_pin,
                    color: Colors.red,
                  ),
                  hintText: "Professor",
                  hintStyle: TextStyle(fontSize: 20),
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextField(
                controller: _classRomController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.class_,
                    color: Colors.yellow,
                  ),
                  hintText: "Sala",
                  hintStyle: TextStyle(fontSize: 20),
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextField(
                controller: _firstHourController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.watch_later,
                    color: Colors.purple,
                  ),
                  hintText: "Horário do primeiro dia",
                  hintStyle: TextStyle(fontSize: 20),
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextField(
                controller: _secondHourController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.watch_later,
                    color: Colors.orange,
                  ),
                  hintText: "Horário do segundo dia",
                  hintStyle: TextStyle(fontSize: 20),
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
