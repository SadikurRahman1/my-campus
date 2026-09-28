import 'package:flutter/material.dart';

enum AttendanceStatus { present, late, absent }

class AttendanceModel {
  final String name;
  final String roll;
  final AttendanceStatus status;
  final String time;

  const AttendanceModel({
    required this.name,
    required this.roll,
    required this.status,
    required this.time,
  });
}

class AttendanceSummaryModel {
  final String title;
  final String value;
  final String caption;
  final IconData icon;
  final Color accentColor;

  const AttendanceSummaryModel({
    required this.title,
    required this.value,
    required this.caption,
    required this.icon,
    required this.accentColor,
  });
}

class AttendanceSubjectModel {
  final String subject;
  final String teacher;
  final String schedule;
  final String room;
  final int attendedClasses;
  final int totalClasses;

  const AttendanceSubjectModel({
    required this.subject,
    required this.teacher,
    required this.schedule,
    required this.room,
    required this.attendedClasses,
    required this.totalClasses,
  });

  double get progress => totalClasses == 0 ? 0 : attendedClasses / totalClasses;
}
