import 'package:flutter/material.dart';

class ClassInfoPage extends StatefulWidget {
  final Map toDoClass;

  ClassInfoPage({this.toDoClass});

  @override
  _ClassInfoPageState createState() => _ClassInfoPageState();
}

class _ClassInfoPageState extends State<ClassInfoPage> {
  Map _editedClass;

  final _professorController = TextEditingController();
  final _classRomController = TextEditingController();
  final _firstHourController = TextEditingController();
  final _secondHourController = TextEditingController();
  final _attendanceRoomController = TextEditingController();
  final _openingHoursController = TextEditingController();
  final _annotationsController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.toDoClass == null)
      _editedClass = {};
    else {
      _editedClass = widget.toDoClass;
    }
  }

  void _addToDo() {
    setState(() {
      if (_professorController.text != null && _professorController.text != "")
        _editedClass["professor"] = _professorController.text;
      if (_classRomController.text != null && _classRomController.text != "")
        _editedClass["classRom"] = _classRomController.text;
      if (_firstHourController.text != null && _firstHourController.text != "")
        _editedClass["firstHour"] = _firstHourController.text;
      if (_secondHourController.text != null &&
          _secondHourController.text != "")
        _editedClass["secondHour"] = _secondHourController.text;
      if (_emailController.text != null && _emailController.text != "")
        _editedClass["email"] = _emailController.text;
      if (_attendanceRoomController.text != null &&
          _attendanceRoomController.text != "")
        _editedClass["attendanceRoom"] = _attendanceRoomController.text;
      if (_openingHoursController.text != null &&
          _openingHoursController.text != "")
        _editedClass["openingHours"] = _openingHoursController.text;
      if (_annotationsController.text != null &&
          _annotationsController.text != "")
        _editedClass["annotations"] = _annotationsController.text;
    });
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
        onPressed: () {
          _addToDo();
        },
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
                controller: _emailController,
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
                controller: _openingHoursController,
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
                "Dias de Aula:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _firstHourController,
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
              TextField(
                controller: _secondHourController,
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
              Divider(
                color: Colors.grey[700],
              ),
              Container(
                height: 500,
                width: 500,
                padding: EdgeInsets.only(top: 20),
                child: TextField(
                  maxLines: 100,
                  controller: _annotationsController,
                  decoration: InputDecoration(
                    hintText: _editedClass["annotations"] != null
                        ? _editedClass["annotations"]
                        : "Anotações",
                    hintStyle: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 20,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
