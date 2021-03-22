import 'package:flutter/material.dart';

class ClassesScreen extends StatefulWidget {
  _ClassesScreenState createState() => _ClassesScreenState();
}

class _ClassesScreenState extends State<ClassesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Classes'),
        ),
        body: new Center(
          child: new Text('Class Data Here'),
        ));
  }
}
