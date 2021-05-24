import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

var _isOpen = [true, false, false];

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.0),
            SingleChildScrollView(
              child: ExpansionPanelList(
                expansionCallback: (int index, bool isOpen) {
                  setState(() {
                    _isOpen[index] = !isOpen;
                  });
                },
                children: [
                  mealPanel("Breakfast", 0,context),
                  mealPanel("Lunch", 1, context),
                  mealPanel("Dinner", 2, context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget mealList(String meal, BuildContext context) {
  return FutureBuilder(
    future: DefaultAssetBundle.of(context).loadString('files/WeeklyMenu.json'),
    builder: (context, snapshot) {
      var allOptions = json.decode(snapshot.data.toString());
      var meals = allOptions == null
          ? []
          : allOptions.where((e) => e["Meal"]== meal).toList();

      return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          
          var m = meals[index];
          return foodCard(
            
            m["ItemName"],
            m["Calories"],
          );
        },
        itemCount: meals == 0 ? 0 : meals.length,
      );
    },
  );
}

Widget foodCard(String name, int cals) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 17,
                color: Colors.grey[900],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Text(
            cals.toString() + " cals",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    ),
    color: Colors.white.withOpacity(.90),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

ExpansionPanel mealPanel(String meal, int val, BuildContext context) {
  return ExpansionPanel(
    
    backgroundColor: Colors.red.withOpacity(.5),
    canTapOnHeader: true,
    headerBuilder: (context, isOpen) {
      return Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Text(
          meal,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
    },
    body: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 500),
        child: mealList(meal, context)),
    isExpanded: _isOpen[val],
  );
}

/*
Widget mealPanelSingleChildScrollView(
  child: column(
    children: [ExpansionTile(


    )])

);
*/