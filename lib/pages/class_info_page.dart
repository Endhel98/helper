import 'package:flutter/material.dart';

class ClassInfoPage extends StatefulWidget {
  final Map toDoClass;

  ClassInfoPage({this.toDoClass});

  @override
  _ClassInfoPageState createState() => _ClassInfoPageState();
}

class _ClassInfoPageState extends State<ClassInfoPage> {
  Map _editedClass;

  @override
  void initState() {
    super.initState();

    if (widget.toDoClass == null)
      _editedClass = {};
    else {
      _editedClass = widget.toDoClass;
    }
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: _editedClass["professor"],
                  hintStyle: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 20,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
