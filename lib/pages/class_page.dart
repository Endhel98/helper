import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ClassPage extends StatefulWidget {
  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  final _classController = TextEditingController();
  final _professorController = TextEditingController();
  final _classRomController = TextEditingController();
  final _hourController = TextEditingController();
  List _toDoList = [];

  @override
  void initState() {
    super.initState();

    _readData().then((data) {
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
      newToDo["hour"] = _hourController.text;
      _toDoList.add(newToDo);
      _saveData();
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
            onPressed: () {},
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
                enabled: false,
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
                    Icons.person,
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
                    Icons.local_library,
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
                controller: _hourController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.watch_later,
                    color: Colors.purple,
                  ),
                  hintText: "Horário",
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

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> _saveData() async {
    String data = json.encode(_toDoList);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
