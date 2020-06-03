import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:helper/animations/growTransition.dart';
import 'package:helper/functionsJson/functions.dart';
import 'package:helper/pages/class_info_page.dart';
import 'package:helper/pages/class_page.dart';
import 'package:helper/widgets/emptyList.widget.dart';
import 'package:helper/widgets/information.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Map<String, dynamic> _lastRemoved;
  int _lastRemovedPos;
  List _toDoList = [];
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation = Tween<double>(begin: 0, end: 250).animate(controller);

    controller.forward();

    readData().then((data) {
      setState(() {
        _toDoList = json.decode(data);
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.8,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "HELPER",
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.import_contacts,
              color: Colors.deepPurpleAccent,
              size: 35,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurpleAccent,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            _showClassPage();
          }),
      body: _toDoList.isEmpty
          ? GrowTransition(
              child: EmptyList(),
              animation: animation,
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
          color: Colors.deepPurpleAccent.withOpacity(0.2),
          child: Align(
            alignment: Alignment(-0.9, 0.0),
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ),
        secondaryBackground: Container(
          color: Colors.deepPurpleAccent.withOpacity(0.2),
          child: Align(
            alignment: Alignment(0.9, 0.0),
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ),
        direction: DismissDirection.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            elevation: 4,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Information(
                    info: _toDoList[index]["class"],
                    color: Colors.green,
                    icon: Icons.school,
                    isClassField: true,
                  ),
                  Information(
                    info: _toDoList[index]["professor"],
                    color: Colors.red,
                    icon: Icons.person_pin,
                    isClassField: false,
                  ),
                  Information(
                    info: _toDoList[index]["classRom"],
                    color: Colors.yellow,
                    icon: Icons.class_,
                    isClassField: false,
                  ),
                  Information(
                    info: _toDoList[index]["firstHour"],
                    color: Colors.black,
                    icon: Icons.watch_later,
                    isClassField: false,
                  ),
                  Information(
                    info: _toDoList[index]["secondHour"],
                    color: Colors.blue,
                    icon: Icons.watch_later,
                    isClassField: false,
                  ),
                ],
              ),
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
                textColor: Colors.deepPurpleAccent,
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

  void _showClassPage() async {
    final recList = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ClassPage()),
    );

    if (recList != null) _toDoList = recList;
  }
}
