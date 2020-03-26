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
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.person_pin,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Professor:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _professorController,
                        focusNode: professorFocusNode,
                        decoration: InputDecoration(
                          hintText: _editedClass["professor"],
                          hintStyle: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    IconButton(
                      splashColor: Colors.blue,
                      icon: Icon(
                        Icons.edit,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          FocusScope.of(context)
                              .requestFocus(professorFocusNode);
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Sala de Atendimento:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _attendanceRoomController,
                        focusNode: attendanceRoomFocusNode,
                        decoration: InputDecoration(
                          hintText: _editedClass["attendanceRoom"],
                          hintStyle: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    IconButton(
                      splashColor: Colors.blue,
                      icon: Icon(
                        Icons.edit,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          FocusScope.of(context)
                              .requestFocus(attendanceRoomFocusNode);
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Horários de Atendimento:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _openingHoursrController,
                        focusNode: openingHoursFocusNode,
                        decoration: InputDecoration(
                          hintText: _editedClass["openingHours"],
                          hintStyle: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    IconButton(
                      splashColor: Colors.blue,
                      icon: Icon(
                        Icons.edit,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          FocusScope.of(context)
                              .requestFocus(openingHoursFocusNode);
                        });
                      },
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey[500],
              ),
              Icon(
                Icons.class_,
                color: Colors.yellow,
                size: 60,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Sala:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _classRomController,
                        focusNode: classRoomFocusNode,
                        decoration: InputDecoration(
                          hintText: _editedClass["classRom"],
                          hintStyle: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    IconButton(
                      splashColor: Colors.blue,
                      icon: Icon(
                        Icons.edit,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          FocusScope.of(context)
                              .requestFocus(classRoomFocusNode);
                        });
                      },
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey[500],
              ),
              Icon(
                Icons.watch_later,
                color: Colors.purple,
                size: 60,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      "1º Dia:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _firstHourController,
                        focusNode: firstHourFocusNode,
                        decoration: InputDecoration(
                          hintText: _editedClass["firstHour"],
                          hintStyle: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    IconButton(
                      splashColor: Colors.blue,
                      icon: Icon(
                        Icons.edit,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          FocusScope.of(context)
                              .requestFocus(firstHourFocusNode);
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      "2º Dia:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _secondHourController,
                        focusNode: secondHourFocusNode,
                        decoration: InputDecoration(
                          hintText: _editedClass["secondHour"],
                          hintStyle: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    IconButton(
                      splashColor: Colors.blue,
                      icon: Icon(
                        Icons.edit,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          FocusScope.of(context)
                              .requestFocus(secondHourFocusNode);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
