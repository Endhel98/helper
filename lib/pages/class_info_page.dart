import 'package:flutter/material.dart';
import 'package:helper/functionsJson/functions.dart';
import 'package:helper/widgets/classInfoPage/annotation.widget.dart';
import 'package:helper/widgets/classInfoPage/classData.widget.dart';
import 'package:helper/widgets/classInfoPage/fieldTitle.widget.dart';

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

  final _classController = TextEditingController();
  final _professorController = TextEditingController();
  final _classRomController = TextEditingController();
  final _firstHourController = TextEditingController();
  final _secondHourController = TextEditingController();
  final _attendanceRoomController = TextEditingController();
  final _annotationsController = TextEditingController();
  final _emailController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _editedClass = widget.toDoClass;
    _editedList = widget.toDoList;
    _index = widget.index;

    _classController.text = _editedClass["class"];
    _professorController.text = _editedClass["professor"];
    _classRomController.text = _editedClass["classRom"];
    _firstHourController.text = _editedClass["firstHour"];
    _secondHourController.text = _editedClass["secondHour"];

    if (_editedClass["attendanceRoom"] != null)
      _attendanceRoomController.text = _editedClass["attendanceRoom"];

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
          _classController.text = "";
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
                      saveData(widget.toDoList);
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
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Image.asset(
            "images/logo.png",
            height: 300,
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white.withOpacity(0.15),
        elevation: 0,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            setState(() {
              _addToDo();
              Navigator.pop(context);
            });
          }
        },
        child: Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(top: 10, left: 25, right: 25),
            child: ListView(
              children: <Widget>[
                ClassData(
                  classController: _classController,
                  attendanceRoomController: _attendanceRoomController,
                  classRomController: _classRomController,
                  emailController: _emailController,
                  firstHourController: _firstHourController,
                  professorController: _professorController,
                  secondHourController: _secondHourController,
                ),
                Divider(color: Colors.transparent),
                FieldTitle(title: "Faltas"),
                Divider(color: Colors.transparent),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white70,
                        size: 30,
                      ),
                      onPressed: () {
                        setState(() {
                          if (_editedClass["absenses"] > 0)
                            _editedClass["absenses"]--;
                        });
                      },
                    ),
                    Text(
                      _editedClass['absenses'].toString(),
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white70,
                        size: 30,
                      ),
                      onPressed: () {
                        setState(() {
                          _editedClass["absenses"]++;
                        });
                      },
                    ),
                  ],
                ),
                Divider(color: Colors.transparent),
                FieldTitle(title: "Anotações"),
                Divider(color: Colors.transparent),
                Annotation(
                  controller: _annotationsController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
