import 'package:flutter/material.dart';
import 'dart:convert';

class ClassesScreen extends StatefulWidget {
  _ClassesScreenState createState() => _ClassesScreenState();
}

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
              ), SizedBox(height:12),
              Expanded(
                child: FutureBuilder(
                    future: DefaultAssetBundle.of(context)
                        .loadString('files/Registration_CW.json'),
                    builder: (context, snapshot) {
                      // Decode the JSON
                      var courses = json.decode(snapshot.data.toString());

                      return ListView.separated(
                          padding: EdgeInsets.all(0),
                          itemCount: courses == null ? 0 : courses.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(height:5);
                          },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  ),
                                ),
                              ),
                              color: Colors.white.withOpacity(.90),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
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
