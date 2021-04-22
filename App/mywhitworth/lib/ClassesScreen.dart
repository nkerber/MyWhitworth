import 'package:flutter/material.dart';
import 'package:mywhitworth/Widgets/Course.dart';
import 'dart:convert';

class ClassesScreen extends StatefulWidget {
  _ClassesScreenState createState() => _ClassesScreenState();
}

class ClassWidget {
  String className = 'CS 171';
  String prof = 'Kent Jones';
  String location = 'Eric Johnston 102';
  int credits = 3;
  TimeOfDay startTime = TimeOfDay(hour: 9, minute: 5);
  TimeOfDay endTime = TimeOfDay(hour: 10, minute: 0);

  Widget classWidget = Card(
    child: Column(
      children: [
        Text(
          'CS 171',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Kent Jones',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        Text(
          'CS 171',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        Text(
          'CS 171',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}

Widget classList1 = Card(
  child: Container(
    height: 120,
    width: 450,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            'CS 171',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Computer Science I',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'MWF, 9:05-10:00am | Eric Johnston 102',
          ),
          Text(
            'Kent Jones, 3 Credits',
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    ),
  ),
);
Widget classList2 = Card(
  child: ListView(
    children: [
      Text(
        'PS 153',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      Text('Robinson 117'),
      Text('Dr. Kamesh Sankaran'),
      Text('11:50-12:45pm'),
    ],
    physics: ClampingScrollPhysics(),
  ),
);
Widget classList3 = Card(
  child: ListView(
    children: [
      Text(
        'MA 397',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      Text('Eric Johnston 214'),
      Text('Dr. Anne Trefry'),
      Text('2:00-2:55pm'),
    ],
    physics: ClampingScrollPhysics(),
  ),
);
Widget classList4 = Card(
  child: ListView(
    children: [
      Text(
        'PH 410',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      Text('Hawthorne 109'),
      Text('Dr. Forrest Baird'),
      Text('6:30-9:30pm'),
    ],
    physics: ClampingScrollPhysics(),
  ),
);

class _ClassesScreenState extends State<ClassesScreen> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(height: 50.0),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  'Your classes',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: DefaultAssetBundle.of(context).loadString('files/Registration_CW.json'),
                  builder: (context, snapshot) {
                  // Decode the JSON
                  var courses = json.decode(snapshot.data.toString());

                  return ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: courses == null ? 0 : courses.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Container(
                            height: 135,
                            width: 450,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text(
                                    courses[index]["courseID"],
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    courses[index]["courseName"],
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${courses[index]["days"]}, ${courses[index]["startTime"]} to ${courses[index]["endTime"]}',
                                  ),
                                  Text(
                                    courses[index]["location"],
                                  ),
                                  Text(
                                    '${courses[index]["professor"]}, ${courses[index]["credit"]} Credits',
                                  ),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                            ),
                          ),
                          color: Colors.white.withOpacity(.85),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        );
                      });
                  }),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}
