import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:helper/functionsJson/functions.dart';
import 'package:helper/pages/class_info_page.dart';
import 'package:helper/pages/class_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Map<String, dynamic> _lastRemoved;
  int _lastRemovedPos;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.white,
          title: Padding(
            padding: EdgeInsets.only(top: 30, left: 20),
            child: Image.asset(
              "images/Helper.png",
            ),
          ),
          centerTitle: true,
        ),
        preferredSize: Size.fromHeight(50),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showContactPage();
        },
        backgroundColor: Color(0xff1E90FF),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: _toDoList.isEmpty
          ? Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Lista Vazia!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.sentiment_dissatisfied,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.only(top: 10.0),
              itemBuilder: buildItem,
              itemCount: _toDoList.length,
            ),
    );
  }

  Widget buildItem(context, index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClassInfoPage(
              toDoClass: _toDoList[index],
              toDoList: _toDoList,
              index: index,
            ),
          ),
        );
      },
      child: Dismissible(
        key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
        background: Container(
          color: Colors.red,
          child: Align(
            alignment: Alignment(-0.9, 0.0),
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ),
        secondaryBackground: Container(
          color: Colors.red,
          child: Align(
            alignment: Alignment(0.9, 0.0),
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ),
        direction: DismissDirection.horizontal,
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.school,
                          color: Colors.lightGreen,
                        ),
                      ),
                      Container(
                        width: 285,
                        child: Text(
                          _toDoList[index]["class"],
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5, left: 6, top: 5),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.person_pin,
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        width: 285,
                        child: Text(
                          _toDoList[index]["professor"],
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5, left: 6, top: 5),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.class_,
                          color: Colors.yellow,
                        ),
                      ),
                      Container(
                        width: 285,
                        child: Text(
                          _toDoList[index]["classRom"],
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5, left: 6, top: 5),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.watch_later,
                          color: Colors.purple,
                        ),
                      ),
                      Container(
                        width: 120,
                        child: Text(
                          _toDoList[index]["firstHour"],
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10, left: 20),
                        child: Icon(
                          Icons.watch_later,
                          color: Colors.orange,
                        ),
                      ),
                      Container(
                        width: 110,
                        child: Text(
                          _toDoList[index]["secondHour"],
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        onDismissed: (direction) {
          setState(() {
            _lastRemoved = Map.from(_toDoList[index]);
            _lastRemovedPos = index;
            _toDoList.removeAt(index);

            saveData(_toDoList);

            final snack = SnackBar(
              content:
                  Text("Disciplina \"${_lastRemoved['class']}\" removida!"),
              action: SnackBarAction(
                label: "Desfazer",
                onPressed: () {
                  setState(() {
                    _toDoList.insert(_lastRemovedPos, _lastRemoved);
                    saveData(_toDoList);
                  });
                },
              ),
              duration: Duration(seconds: 2),
            );

            Scaffold.of(context).removeCurrentSnackBar();
            Scaffold.of(context).showSnackBar(snack);
          });
        },
      ),
    );
  }

  void _showContactPage() async {
    final recList = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ClassPage()),
    );

    if (recList != null) _toDoList = recList;
  }
}
