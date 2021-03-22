import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Menu'),
        ),
        body: new Center(
          child: new Text('Menu Data Here'),
        ));
  }
}