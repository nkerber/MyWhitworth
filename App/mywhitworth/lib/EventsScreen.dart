import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mywhitworth/EventView.dart';
import 'package:url_launcher/url_launcher.dart';

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

Color eventColor(String dept) {
  if (dept == "Chaplain" || dept == "Theology")
    return Colors.blue[900];
  else if (dept == "Admissions" ||
      dept == "Student Activities" ||
      dept == "Student Life" ||
      dept == "President's Office")
    return Colors.red[900];
  else if (dept == "Music" || dept == "Theatre")
    return Colors.orange[900];
  else if (dept == "Biology" || dept == "Health Science")
    return Colors.green[900];
  else
    return Colors.grey[800];
}

var months = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];

var shortMonths = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec"
];

var days = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday"
];

Widget eventCard(
    Color deptColor,
    String startTime,
    String eventName,
    String department,
    String location,
    DateTime date,
    String description,
    String link,
    bool upcoming,
    BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EventView(deptColor, startTime, eventName,
            department, location, date, description, link),
      ),
    ),
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 10.0,
                      height: 10.0,
                      decoration: new BoxDecoration(
                        color: deptColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      upcoming
                          ? "${shortMonths[date.month - 1]} ${date.day}"
                          : startTime,
                      style: TextStyle(fontSize: 17, color: Colors.grey[700]),
                    ),
                    SizedBox(width: 5.0),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventName,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900],
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey[700],
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text(
                        department,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: deptColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      color: Colors.white.withOpacity(.90),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

Widget todayList(BuildContext context, DateTime d) {
  //log('in todaylist');
  return FutureBuilder(
    future:
        DefaultAssetBundle.of(context).loadString('files/campusevents.json'),
    builder: (context, snapshot) {
      //log('in builder');
      var events = json.decode(snapshot.data.toString());
      var futureEvents = events == null
          ? []
          : events
              .where((e) => DateTime.parse(e["EndDate"]).compareTo(d) == 0)
              .toList();

      var someEvents = (c, i) {
        var e = futureEvents[i];
        //log('someEvents: $i');
        return eventCard(
            eventColor(e["Department"]),
            e["StartTime"],
            e["Title"],
            e["Department"],
            e["Building"],
            DateTime.parse(e["EndDate"]),
            e["Description"],
            e["URL"],
            false,
            context);
      };
      var noEvents = (c, i) {
        //log('in Noevents');
        return Card(child: Text("No events today!"));
      };

      log('building list: ${futureEvents.length}');
      return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: futureEvents == null || futureEvents.length == 0
            ? noEvents
            : someEvents,
        itemCount: futureEvents == null || futureEvents.length == 0
            ? 1
            : futureEvents.length,
      );
    },
  );
}

Widget upcomingList(BuildContext context, DateTime d) => FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString('files/campusevents.json'),
      builder: (context, snapshot) {
        var events = json.decode(snapshot.data.toString());
        var futureEvents = events == null
            ? []
            : events
                .where((e) => DateTime.parse(e["EndDate"]).compareTo(d) > 0)
                .toList();

        futureEvents.sort(
          (a, b) => DateTime.parse(a["EndDate"]).compareTo(
            DateTime.parse(b["EndDate"]),
          ),
        );

        return ListView.builder(
          padding: EdgeInsets.all(0),
          itemBuilder: (context, index) {
            var e = futureEvents[index];
            return eventCard(
                eventColor(e["Department"]),
                e["StartTime"],
                e["Title"],
                e["Department"],
                e["Building"],
                DateTime.parse(e["EndDate"]),
                e["Description"],
                e["URL"],
                true,
                context);
          },
          itemCount: futureEvents == null ? 0 : futureEvents.length,
        );
      },
    );

class _EventsScreenState extends State<EventsScreen> {
  DateTime selectedDate = DateTime.utc(2021, 5, 1, 7, 0, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.0),
              title(selectedDate),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 350, minHeight: 5),
                //child: Container(
                child: todayList(context, selectedDate),
                //color: Colors.green),
              ),
              Text(
                'Upcoming',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
              Expanded(
                child: upcomingList(context, selectedDate),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget title(DateTime selectedDate) {
  return Padding(
    padding: const EdgeInsets.only(left: 5, right: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Today',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.right,
        ),
        Text(
          days[selectedDate.weekday - 1] +
              ", " +
              months[selectedDate.month - 1] +
              " " +
              selectedDate.day.toString(),
          style: TextStyle(
            fontSize: 30.0,
            //fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    ),
  );
}
