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

class _CampusScreenState extends State<CampusScreen> {
  double mapw, maph;
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
  ];

  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset('assets/images/Map2.svg', width: mapw,height:maph),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              color: Colors.white.withOpacity(0.8),
              child: Container(
                height: 200,
                width: 450,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  
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
              ),),),
          
        ],
      ),
    );
  }
}
  
          /*Container(
            color: Colors.red.withOpacity(.5),
            child: PhotoView(
              imageProvider: AssetImage('assets/images/Map.png'),
              minScale: PhotoViewComputedScale.contained * 3.7,
              maxScale: PhotoViewComputedScale.covered * 10,
              enableRotation: true,
            ),
          ),
          



WebViewController _webViewController;
  String filePath = 'files/index.html';
body: WebView(
        initialUrl: '', javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _loadHtmlFromAssets();
        },
      ),
  _loadHtmlFromAssets() async {
    String file = await rootBundle.loadString(filePath);
    _webViewController.loadUrl(Uri.dataFromString(file,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString());
  }
*/

/*Text(
          'Map Data Here',
          style: TextStyle(fontSize: 25, color: Colors.white),*/

/**/

// https://flutter-examples.com/flutter-load-local-html-file/#:~:text=Now%20before%20start%20coding%20we,file%20in%20any%20code%20editor.
