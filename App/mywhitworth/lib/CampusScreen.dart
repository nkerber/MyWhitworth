import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';
import 'dart:convert';

import 'package:webview_flutter/webview_flutter.dart';

class CampusScreen extends StatefulWidget {
  @override
  _CampusScreenState createState() => _CampusScreenState();
}

class MoveableStackItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MoveableStackItemState();
  }
}

class _MoveableStackItemState extends State<MoveableStackItem> {
  List numbersList = [
    'McEachran Hall – Administration',
    'MacKay Hall – Admissions',
    'Cowles Memorial Auditorium',
    'Cutter Courts',
    'Cowles Music Center',
    'Auld House – Human Resources',
    'Dixon Hall',
    'Warren Hall',
    'Tacoma Hall',
    'Beeksma Family Theology Center - Seeley G. Mudd Chapel',
    'Ballard Hall',
    'McMillan Hall',
    'Graves Gymnasium',
    'Fieldhouse',
    'Aquatic Center',
    'Scotford Strength & Conditioning Center',
    'Westminster Hall',
    'Weyerhaeuser Hall',
    'Lied Center for the Visual Arts',
    'Pirates Cove',
    'Hill House',
    'Steam Plant',
    'Robinson Science Hall',
    'Lindaman Center',
    'H.C. Cowles Memorial Library',
    'Johnston Science Center',
    'Baldwin-Jenkins Hall',
    'Hendrick Hall',
    'Stewart Hall',
    'Village (Akili)',
    'Village (Tiki)',
    'Village (Shalom)',
    'Arend Hall',
    'Boppell Hall',
    'Hixson Union Building (HUB)',
    'Hawthorne Hall',
    'President’s House',
    'Duvall Hall',
    'Hardwick House',
    'Recreation Center (U-Rec)',
    'Campus Security Office',
    'Health Science Building',
    'Facilities Services Admin',
    'Facilities Services Trades/Grounds',
    'Facilities Services Warehouse',
    'The Pines Café/Bookstore',
    'Campanile',
    'Pine Bowl',
    'Omache Field',
    'Marks Field',
    'Soccer Field',
    'Totem Pole',
    'Merkel Field',
    'Tennis Dome',
    'Tennis Courts',
    'Soccer Practice Field',
    'Ampitheatre'
  ];

  double xPos = 0;
  double yPos = 610;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: yPos,
      left: xPos,
      child: GestureDetector(
          onPanUpdate: (tapInfo) {
            setState(() {
              //xPos += tapInfo.delta.dx;
              if ((yPos + tapInfo.delta.dy) > 30 &&
                  (yPos + tapInfo.delta.dy) < 611) {
                    yPos += tapInfo.delta.dy;
              } 
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              color: Colors.white.withOpacity(0.8),
              child: Container(
                height: 200,
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Key',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          padding: EdgeInsets.only(top: 0, bottom: 10),
                          itemCount: numbersList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${index + 1}',
                                      style: TextStyle(fontSize: 18)),
                                  Expanded(
                                    child: Text(
                                      '${numbersList[index]}',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          //shrinkWrap: true
                          ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

class _CampusScreenState extends State<CampusScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.red.withOpacity(.5),
            child: PhotoView(
              imageProvider: AssetImage('assets/images/Map.png'),
              minScale: PhotoViewComputedScale.contained * 3.7,
              maxScale: PhotoViewComputedScale.covered * 10,
              enableRotation: true,
              loadingBuilder: (context, progress) =>
                  Center(child: CircularProgressIndicator()),
            ),
          ),
          MoveableStackItem()
        ],
      ),
    );
  }
}

//alignment: Alignment.bottomCenter,