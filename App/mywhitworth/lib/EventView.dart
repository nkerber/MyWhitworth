import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'EventsScreen.dart';

class EventView extends StatelessWidget {
  final Color deptColor;
  final String startTime;
  final String eventName;
  final String department;
  final String location;
  final DateTime date;
  final String description;
  final String infoLink;

  EventView(this.deptColor, this.startTime, this.eventName, this.department,
      this.location, this.date, this.description, this.infoLink);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Scaffold(
        backgroundColor: Colors.red[800].withOpacity(.8),
        body: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      
                      Expanded(
                        child: Text(
                          eventName,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[900],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      GestureDetector(onTap: () => Navigator.pop(context), child: Icon(Icons.close_rounded)),
                    ],),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: deptColor,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          department,
                          style: TextStyle(
                              color: deptColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "${months[date.month]} ${date.day} | $startTime",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      location,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      child: Row(
                        children: [
                          Text(
                            "More",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              color: Colors.blueAccent, size: 20),
                        ],
                      ),
                      onTap: () => launch(infoLink),
                    )
                  ],
                ),
              ),
              color: Colors.white.withOpacity(.90),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),]
    );
  }
}
