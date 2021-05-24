import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mywhitworth/ClassesScreen.dart';
import 'package:mywhitworth/Menu.dart';
import 'package:mywhitworth/EventsScreen.dart';
import 'package:mywhitworth/CampusScreen.dart';
import 'package:mywhitworth/MoreScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyWhitworth',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.red[800].withOpacity(0.65),
      ),
      home: MainNavBar(),
    );
  }
}

class MainNavBar extends StatefulWidget {
  @override
  _MainNavBarState createState() => _MainNavBarState();
}

class _MainNavBarState extends State<MainNavBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    ClassesScreen(),
    MenuScreen(),
    EventsScreen(),
    CampusScreen(),
    MoreScreen(),
  ];

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: new BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          body: _children[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (int value) {
              setState(() {
                _currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.clock,
                    size: 25.0,
                  ),
                  label: 'Classes'),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.utensils,
                    size: 25.0,
                  ),
                  label: 'Meals'),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.calendarAlt,
                    size: 25.0,
                  ),
                  label: 'Events'),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.mapMarkerAlt,
                    size: 25.0,
                  ),
                  label: 'Campus'),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.ellipsisH,
                    size: 25.0,
                  ),
                  label: 'More'),
            ],
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white.withOpacity(.95),
          ),
        ),
      ],
    );
  }
}
