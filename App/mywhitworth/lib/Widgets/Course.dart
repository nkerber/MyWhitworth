import 'package:flutter/material.dart';

class Course {
  String _courseID;
  String _courseName;
  String _prof;
  String _location;
  int _credits;
  String _days;
  TimeOfDay _startTime;
  TimeOfDay _endTime;

  Course(this._courseID, this._courseName, this._prof, this._location,
      this._days, this._credits, this._startTime, this._endTime);
}
