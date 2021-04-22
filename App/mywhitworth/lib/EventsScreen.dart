import 'package:flutter/material.dart';


class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

Widget todayList = Card(
  child: ListView(
    children: [
      Text('Today',
      style: 
      TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold
      ),),
      Text('Community Worship'),
      Text('Balance Your Bucs'),
      Text('Namaste'),
    ],
  ),
);
Widget upcomingList = Card(
  child: ListView(
    children: [
      Text('Upcoming',
      style: 
      TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold
      ),),
      Text('ASWU Weekly Meeting'),
      Text('WU vs Montana'),
      Text('Namaste boii'),
    ],
  ),
);
Widget promotionList = Card(
  child: ListView(
    children: [
      Text('Promotions',
      style: 
      TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold
      ),),
      Text('Ski Waxing & Tuning'),
      Text('Elon Musk Webinar'),
      Text('DogeCoin to Mars'),
    ],
  ),
);
class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 50.0, bottom: 20.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              Expanded(child: todayList), Expanded(child: upcomingList), Expanded(child: promotionList)
            
            ],
          ),
        ),
      ),
    );
  }
}
/* RSS Feed URL: https://www.whitworth.edu/~rss/events.rss.xml */

/*Widget quickCalls = Container(
  child: Card(
    child: Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(
        12,
        12,
        12,
        12,
      ),
      'Event Data Here',
            style: TextStyle(fontSize: 25, color: Colors.white),/

*/


/*Text(
                'Suggested Apps & Links',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              );*/