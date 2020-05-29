import 'package:flutter/material.dart';
import 'package:helper/pages/teste.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      title: "Helper",
      home: Teste(),
    );
  }
}
