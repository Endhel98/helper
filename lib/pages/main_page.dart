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
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              toDoList[index]["class"],
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Text(
              toDoList[index]["professor"],
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  toDoList[index]["classRom"],
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  toDoList[index]["hour"],
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
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
