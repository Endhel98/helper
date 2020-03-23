import 'package:flutter/material.dart';
import 'package:helper/pages/class_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //Map<String, dynamic> _lastRemoved;
  //int _lastRemovedPos;
  List toDoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          "Helper",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showContactPage();
        },
        backgroundColor: Colors.lightBlue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: ListView.builder(
        padding: EdgeInsets.only(top: 10.0),
        itemBuilder: buildItem,
        itemCount: toDoList.length,
      ),
    );
  }

  Widget buildItem(context, index) {
    return ListTile(
      title: Text(toDoList[index]["class"]),
    );
  }

  void _showContactPage() async {
    final recList = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ClassPage()),
    );

    toDoList = recList;
  }
}
