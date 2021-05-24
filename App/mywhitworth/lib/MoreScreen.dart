import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void _call(String number) async {
  String telNum = 'tel:$number';
  if (await canLaunch(telNum)) {
    await launch(telNum);
  } else {
    print('Could not launch $telNum');
  }
}

Widget quickCalls = Container(
  child: Card(
    child: Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(
        12,
        12,
        12,
        12,
      ),
      child: Column(children: [
        Row(
          children: [
            Text(
              'Quick Calls',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                IconButton(
                  color: Colors.red[800],
                  iconSize: 35,
                  icon: const Icon(
                    FontAwesomeIcons.solidBell,
                  ),
                  onPressed: () {
                    _call('911');
                  },
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 5.0),
                  child: Text(
                    '911',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                IconButton(
                  color: Colors.blue[800],
                  iconSize: 35,
                  icon: const Icon(FontAwesomeIcons.video),
                  onPressed: () {
                    _call('5097774444');
                  },
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 5.0),
                  child: Text(
                    'Campus\nSecurity',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                IconButton(
                  color: Colors.green[800],
                  iconSize: 35,
                  icon: const Icon(FontAwesomeIcons.firstAid),
                  onPressed: () {
                    _call('1-509-777-3259');
                  },
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 5.0),
                  child: Text(
                    'Health\nCenter',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                IconButton(
                  color: Colors.yellow[800],
                  iconSize: 35,
                  icon: const Icon(FontAwesomeIcons.solidQuestionCircle),
                  onPressed: () {
                    _call('1-509-777-3271');
                  },
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 5.0),
                  child: Text(
                    'Student\nLife',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                IconButton(
                  color: Colors.purple[800],
                  iconSize: 35,
                  icon: const Icon(FontAwesomeIcons.running),
                  
                  onPressed: () {
                    _call('1-509-777-3134');
                  },
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 5.0),
                  child: Text(
                    'U-Rec',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ]),
    ),
    color: Colors.white.withOpacity(.85),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  padding: const EdgeInsets.only(
    top: 10,
    bottom: 10,
  ),
);

Widget suggestions = Container(
  child: Card(
    child: Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(
        12,
        12,
        12,
        0,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Suggested Links',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => launch('https://blackboard.whitworth.edu/'),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/Blackboard.png',
                        width: 70,
                        height: 70,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          top: 5.0,
                        ),
                        child: Text(
                          'Blackboard',
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () => launch(
                      'https://community.whitworth.edu/Pages/Default.aspx'),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/PiratePort.png',
                        width: 70,
                        height: 70,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          top: 5.0,
                        ),
                        child: Text(
                          'Pirate Port',
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () =>
                      launch('https://whitworth.joinhandshake.com/login'),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/Handshake.png',
                        width: 70,
                        height: 70,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          top: 5.0,
                        ),
                        child: Text(
                          'Handshake',
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () => launch('https://whitworthoutdoors.com/'),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/WOR.png',
                        width: 70,
                        height: 70,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          top: 5.0,
                        ),
                        child: Text(
                          'Whitworth Outdoors',
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 13.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => launch(
                    'https://www.whitworth.edu/cms/administration/financial-aid/'),
                child: Text('Financial Aid'),
              ),
              Text('|'),
              TextButton(
                onPressed: () => launch(
                    'https://www.whitworth.edu/cms/administration/university-recreation-center/'),
                child: Text('U-Rec'),
              ),
              Text('|'),
              TextButton(
                onPressed: () =>
                    launch('https://www.bkstr.com/whitworthstore/home'),
                child: Text('Bookstore'),
              ),
              Text('|'),
              TextButton(
                onPressed: () => launch(
                    'https://www.whitworth.edu/cms/administration/registrar/'),
                child: Text('Registrar'),
              ),
            ],
          ),
        ],
      ),
    ),
    color: Colors.white.withOpacity(.85),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
);

Widget credit = Container(
  child: Text(
    'MyWhitworth was created with love by Nate Kerber ‘23 & Christian Williams ’21.',
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16.0,
    ),
    textAlign: TextAlign.center,
  ),
);

class MoreScreen extends StatefulWidget {
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<MoreScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 50.0),
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                'More',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            quickCalls,
            suggestions,
            Expanded(
              child: Align(
                child: credit,
                alignment: Alignment.center,
              ),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
