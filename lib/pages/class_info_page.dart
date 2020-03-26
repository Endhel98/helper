import 'package:flutter/material.dart';

class ClassInfoPage extends StatefulWidget {
  final Map toDoClass;

  ClassInfoPage({this.toDoClass});

  @override
  _ClassInfoPageState createState() => _ClassInfoPageState();
}

class _ClassInfoPageState extends State<ClassInfoPage> {
  Map _editedClass;

  FocusNode professorFocusNode;
  FocusNode classRoomFocusNode;
  FocusNode firstHourFocusNode;
  FocusNode secondHourFocusNode;
  FocusNode attendanceRoomFocusNode;
  FocusNode openingHoursFocusNode;

  final _professorController = TextEditingController();
  final _classRomController = TextEditingController();
  final _firstHourController = TextEditingController();
  final _secondHourController = TextEditingController();
  final _attendanceRoomController = TextEditingController();
  final _openingHoursrController = TextEditingController();

  @override
  void initState() {
    super.initState();
    professorFocusNode = FocusNode();
    classRoomFocusNode = FocusNode();
    firstHourFocusNode = FocusNode();
    secondHourFocusNode = FocusNode();
    attendanceRoomFocusNode = FocusNode();
    openingHoursFocusNode = FocusNode();
    if (widget.toDoClass == null)
      _editedClass = {};
    else {
      _editedClass = widget.toDoClass;
    }
  }

  @override
  void dispose() {
    professorFocusNode.dispose();
    classRoomFocusNode.dispose();
    firstHourFocusNode.dispose();
    secondHourFocusNode.dispose();
    attendanceRoomFocusNode.dispose();
    openingHoursFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _editedClass["class"],
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Professor:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _professorController,
                focusNode: professorFocusNode,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(30),
                  hintText: _editedClass["professor"],
                  hintStyle: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 20,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.edit,
                    color: Colors.grey,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Email:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _professorController,
                focusNode: professorFocusNode,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(30),
                  hintText: _editedClass["email"],
                  hintStyle: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 20,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.edit,
                    color: Colors.grey,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Sala de Atendimento:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _attendanceRoomController,
                focusNode: attendanceRoomFocusNode,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(30),
                  hintText: _editedClass["attendanceRoom"],
                  hintStyle: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 20,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.edit,
                    color: Colors.grey,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Horários de Atendimento:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _openingHoursrController,
                focusNode: openingHoursFocusNode,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(30),
                  hintText: _editedClass["openingHours"],
                  hintStyle: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 20,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.edit,
                    color: Colors.grey,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              Divider(
                color: Colors.grey[700],
              ),
              Text(
                "Sala:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _classRomController,
                focusNode: classRoomFocusNode,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(30),
                  hintText: _editedClass["classRom"],
                  hintStyle: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 20,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.edit,
                    color: Colors.grey,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              Divider(
                color: Colors.grey[700],
              ),
              Text(
                "1º Dia:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _firstHourController,
                focusNode: firstHourFocusNode,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(30),
                  hintText: _editedClass["firstHour"],
                  hintStyle: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 20,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.edit,
                    color: Colors.grey,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "2º Dia:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _secondHourController,
                focusNode: secondHourFocusNode,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(30),
                  hintText: _editedClass["secondHour"],
                  hintStyle: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 20,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.edit,
                    color: Colors.grey,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
