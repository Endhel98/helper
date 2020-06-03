import 'package:flutter/material.dart';
import 'package:helper/pages/home_page.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      title: "Helper",
      home: HomePage(),
    );
  }
}
