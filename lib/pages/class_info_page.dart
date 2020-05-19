import 'package:flutter/material.dart';
import 'package:helper/functionsJson/functions.dart';

enum Options { cleanFields, resetAbsenses, deleteClass }

class ClassInfoPage extends StatefulWidget {
  final Map<String, dynamic> toDoClass;
  final List toDoList;
  final int index;

  ClassInfoPage({this.toDoClass, this.toDoList, this.index});

  @override
  _ClassInfoPageState createState() => _ClassInfoPageState();
}

class _ClassInfoPageState extends State<ClassInfoPage> {
  Map<String, dynamic> _editedClass = Map();
  List _editedList;
  int _index;

  final _professorController = TextEditingController();
  final _classRomController = TextEditingController();
  final _firstHourController = TextEditingController();
  final _secondHourController = TextEditingController();
  final _attendanceRoomController = TextEditingController();
  final _annotationsController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _editedClass = widget.toDoClass;
    _editedList = widget.toDoList;
    _index = widget.index;

    if (_editedClass["professor"] != null)
      _professorController.text = _editedClass["professor"];
    if (_editedClass["classRom"] != null)
      _classRomController.text = _editedClass["classRom"];
    if (_editedClass["firstHour"] != null)
      _firstHourController.text = _editedClass["firstHour"];
    if (_editedClass["secondHour"] != null)
      _secondHourController.text = _editedClass["secondHour"];
    if (_editedClass["attendanceRoom"] != null)
      _attendanceRoomController.text = _editedClass["attendanceRoom"];
    else
      _attendanceRoomController.text = "";
    if (_editedClass["email"] != null)
      _emailController.text = _editedClass["email"];
    if (_editedClass["annotations"] != null)
      _annotationsController.text = _editedClass["annotations"];
  }

  void _addToDo() {
    setState(() {
      if (_professorController.text != null)
        _editedClass["professor"] = _professorController.text;
      if (_classRomController.text != null)
        _editedClass["classRom"] = _classRomController.text;
      if (_firstHourController.text != null)
        _editedClass["firstHour"] = _firstHourController.text;
      if (_secondHourController.text != null)
        _editedClass["secondHour"] = _secondHourController.text;
      if (_emailController.text != null)
        _editedClass["email"] = _emailController.text;
      if (_attendanceRoomController.text != null)
        _editedClass["attendanceRoom"] = _attendanceRoomController.text;
      if (_annotationsController.text != null)
        _editedClass["annotations"] = _annotationsController.text;

      _editedList[_index] = _editedClass;
      saveData(_editedList);
    });
  }

  void _options(Options result) {
    switch (result) {
      case Options.cleanFields:
        setState(() {
          _professorController.text = "";
          _classRomController.text = "";
          _firstHourController.text = "";
          _secondHourController.text = "";
          _attendanceRoomController.text = "";
          _annotationsController.text = "";
          _emailController.text = "";
        });
        break;
      case Options.resetAbsenses:
        setState(() {
          _editedClass["absenses"] = 0;
        });
        break;
      case Options.deleteClass:
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Tem certeza que deseja excluir a matéria?"),
                content:
                    Text("Se sim, a matéria será excluída permanentemente!"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Cancelar"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text("Sim"),
                    onPressed: () {
                      widget.toDoList.remove(_editedClass);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            });
        break;
      default:
    }
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
          actions: <Widget>[
            PopupMenuButton<Options>(
              itemBuilder: (context) => <PopupMenuEntry<Options>>[
                const PopupMenuItem<Options>(
                  child: Text("Limpar todos os campos"),
                  value: Options.cleanFields,
                ),
                const PopupMenuItem<Options>(
                  child: Text("Zerar Faltas"),
                  value: Options.resetAbsenses,
                ),
                const PopupMenuItem<Options>(
                  child: Text("Excluir Matéria"),
                  value: Options.deleteClass,
                ),
              ],
              onSelected: _options,
            )
          ],
        ),
        preferredSize: Size.fromHeight(50),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff1E90FF),
        onPressed: () {
          setState(() {
            _addToDo();
            Navigator.pop(context);
          });
        },
        child: Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    color: Colors.blue[50],
                    height: 27,
                    width: 300,
                    alignment: Alignment(0, 0),
                    child: Text(
                      "Professor",
                      style: TextStyle(
                        color: Color(0xff1E90FF),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextField(
                    controller: _professorController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Nome',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                    style: TextStyle(fontSize: 16),
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                    style: TextStyle(fontSize: 16),
                  ),
                  TextField(
                    controller: _attendanceRoomController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Sala',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                    style: TextStyle(fontSize: 16),
                  ),
                  Divider(color: Colors.transparent),
                  Container(
                    color: Colors.blue[50],
                    height: 27,
                    width: 300,
                    alignment: Alignment(0, 0),
                    child: Text(
                      "Sala",
                      style: TextStyle(
                        color: Color(0xff1E90FF),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextField(
                    controller: _classRomController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Num',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                    style: TextStyle(fontSize: 16),
                  ),
                  Divider(color: Colors.transparent),
                  Container(
                    color: Colors.blue[50],
                    height: 27,
                    width: 300,
                    alignment: Alignment(0, 0),
                    child: Text(
                      "Horário",
                      style: TextStyle(
                        color: Color(0xff1E90FF),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextField(
                    controller: _firstHourController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          '1º Dia',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                    style: TextStyle(fontSize: 16),
                  ),
                  TextField(
                    controller: _secondHourController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          '2º Dia',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Divider(color: Colors.transparent),
              Container(
                color: Colors.blue[50],
                height: 27,
                width: 300,
                alignment: Alignment(0, 0),
                child: Text(
                  "Faltas",
                  style: TextStyle(
                    color: Color(0xff1E90FF),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(color: Colors.transparent),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 70.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff1E90FF),
                    ),
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          _editedClass["absenses"]++;
                        });
                      },
                      child: Text(
                        _editedClass['absenses'].toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.remove_circle,
                      color: Colors.red,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        if (_editedClass["absenses"] > 0)
                          _editedClass["absenses"]--;
                      });
                    },
                  ),
                ],
              ),
              Divider(color: Colors.transparent),
              Container(
                color: Colors.blue[50],
                height: 27,
                width: 300,
                alignment: Alignment(0, 0),
                child: Text(
                  "Anotações",
                  style: TextStyle(
                    color: Color(0xff1E90FF),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(color: Colors.transparent),
              Container(
                height: 500,
                width: 500,
                padding: EdgeInsets.only(top: 20),
                child: TextField(
                  maxLines: 100,
                  controller: _annotationsController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
