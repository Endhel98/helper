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
  FocusNode classRomFocusNode;
  FocusNode firstHourFocusNode;
  FocusNode secondHourFocusNode;

  final _professorController = TextEditingController();
  final _classRomController = TextEditingController();
  final _firstHourController = TextEditingController();
  final _secondHourController = TextEditingController();

  @override
  void initState() {
    super.initState();
    professorFocusNode = FocusNode();
    classRomFocusNode = FocusNode();
    firstHourFocusNode = FocusNode();
    secondHourFocusNode = FocusNode();
    if (widget.toDoClass == null)
      _editedClass = {};
    else {
      _editedClass = widget.toDoClass;
    }
  }

  @override
  void dispose() {
    professorFocusNode.dispose();
    classRomFocusNode.dispose();
    firstHourFocusNode.dispose();
    secondHourFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
                      "Sala:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _classRomController,
                        focusNode: classRomFocusNode,
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
                              .requestFocus(classRomFocusNode);
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
