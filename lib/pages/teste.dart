import 'package:flutter/material.dart';
import 'package:helper/pages/class_page.dart';
import 'package:helper/pages/home_page.dart';

class Teste extends StatefulWidget {
  @override
  _TesteState createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  final _scrollViewController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          controller: _scrollViewController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.deepPurpleAccent,
                centerTitle: true,
                title: Text(
                  "HELPER",
                  style: TextStyle(color: Colors.white),
                ),
                pinned: true,
                floating: true,
                forceElevated: innerBoxIsScrolled,
                bottom: TabBar(
                  tabs: <Tab>[
                    Tab(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(
                            Icons.view_list,
                            color: Colors.white,
                          ),
                          Text(
                            "LISTA",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(
                            Icons.library_add,
                            color: Colors.white,
                          ),
                          Text(
                            "Add Matéria",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              HomePage(),
              ClassPage(),
            ],
          ),
        ),
      ),
    );
  }
}
