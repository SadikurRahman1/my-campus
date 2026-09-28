import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/attendance_model.dart';

class AttendanceController extends GetxController {
  int selectedSubjectIndex = 0;

  final summaries = const [
    AttendanceSummaryModel(
      title: 'Present',
      value: '42',
      caption: 'Students checked in',
      icon: Icons.check_circle_outline,
      accentColor: Color(0xFF1B8F5A),
    ),
    AttendanceSummaryModel(
      title: 'Late',
      value: '3',
      caption: 'Arrived after time',
      icon: Icons.schedule_outlined,
      accentColor: Color(0xFFE08A00),
    ),
    AttendanceSummaryModel(
      title: 'Absent',
      value: '5',
      caption: 'Not marked present',
      icon: Icons.highlight_off_outlined,
      accentColor: Color(0xFFCC4B37),
    ),
  ];

  final subjects = const [
    AttendanceSubjectModel(
      subject: 'Database Systems',
      teacher: 'Ms. Jahan',
      schedule: 'Mon, 01:30 PM - 02:30 PM',
      room: 'Lab 1',
      attendedClasses: 18,
      totalClasses: 20,
    ),
    AttendanceSubjectModel(
      subject: 'Programming Fundamentals',
      teacher: 'Ms. Chowdhury',
      schedule: 'Sun, 09:15 AM - 10:15 AM',
      room: 'Lab 2',
      attendedClasses: 16,
      totalClasses: 20,
    ),
    AttendanceSubjectModel(
      subject: 'Mathematics',
      teacher: 'Dr. Rahman',
      schedule: 'Sat, 08:00 AM - 09:00 AM',
      room: 'Room 301',
      attendedClasses: 19,
      totalClasses: 20,
    ),
  ];

  final records = const [
    AttendanceModel(
      name: 'Abdullah Al Mamun',
      roll: 'CSE-01',
      status: AttendanceStatus.present,
      time: '08:05 AM',
    ),
    AttendanceModel(
      name: 'Nusrat Jahan',
      roll: 'CSE-02',
      status: AttendanceStatus.late,
      time: '08:18 AM',
    ),
    AttendanceModel(
      name: 'Farhan Hossain',
      roll: 'CSE-03',
      status: AttendanceStatus.absent,
      time: 'Marked absent',
    ),
    AttendanceModel(
      name: 'Sadia Rahman',
      roll: 'CSE-04',
      status: AttendanceStatus.present,
      time: '08:02 AM',
    ),
  ];

  void selectSubject(int index) {
    selectedSubjectIndex = index;
    update();
  }

  AttendanceSubjectModel get selectedSubject => subjects[selectedSubjectIndex];

  double get overallProgress {
    final totalProgress = subjects.fold<double>(0, (sum, subject) => sum + subject.progress);
    return subjects.isEmpty ? 0 : totalProgress / subjects.length;
  }

  String get overallProgressLabel => '${(overallProgress * 100).round()}% average attendance';
}
