import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends StatefulWidget {
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<MoreScreen> {

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text('More',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  )),
            )
          ],
        ),
      ),
    );
  }
}

/* home: Scaffold(
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
      ),*/