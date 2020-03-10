import 'package:flutter/material.dart';

class ClassPage extends StatefulWidget {
  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
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
        onPressed: () {},
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
}
