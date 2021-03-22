import 'package:flutter/material.dart';

class CampusScreen extends StatefulWidget {
  @override
  _CampusScreenState createState() => _CampusScreenState();
}

class _CampusScreenState extends State<CampusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Campus'),
        ),
        body: new Center(
          child: new Text('Campus Map Here'),
        ));
  }
}