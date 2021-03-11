import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//The main function is the starting point for all of our functions
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[50],
        appBar: AppBar(
          title: Text('My Whitworth'),
          backgroundColor: Colors.red[800],
        ),
        body: Center(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: TextButton(
                      onPressed: () =>
                          launch('https://blackboard.whitworth.edu/'),
                      child: Image.asset(
                        'assets/images/Blackboard.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: TextButton(
                      onPressed: () => launch(
                          'https://community.whitworth.edu/Pages/Default.aspx'),
                      child: Image.asset(
                        'assets/images/PiratePort.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: TextButton(
                      onPressed: () =>
                          launch('https://whitworth.joinhandshake.com/login'),
                      child: Image.asset(
                        'assets/images/Handshake.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: TextButton(
                      onPressed: () => launch('https://whitworthoutdoors.com/'),
                      child: Image.asset(
                        'assets/images/WOR.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
/*
_launchURL() async {
  const url = 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwif44bg_6PvAhUM7J4KHSJUDX4QFjAAegQIAhAD&url=https%3A%2F%2Fapps.apple.com%2Fus%2Fapp%2Fblackboard%2Fid950424861&usg=AOvVaw3HgqdNpWllCJH9RKcG0AAd';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}*/