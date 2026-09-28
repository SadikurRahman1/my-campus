import 'package:get/get.dart';

import '../../data/models/routine_model.dart';

class RoutineController extends GetxController {
  final days = const [
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
  ];

  final selectedDayIndex = 0.obs;

  final List<RoutineModel> routines = const [
    RoutineModel(
      day: 'Saturday',
      subject: 'Mathematics',
      time: '08:00 AM - 09:00 AM',
      room: 'Room 301',
      teacher: 'Dr. Rahman',
    ),
    RoutineModel(
      day: 'Sunday',
      subject: 'Programming Fundamentals',
      time: '09:15 AM - 10:15 AM',
      room: 'Lab 2',
      teacher: 'Ms. Chowdhury',
    ),
    RoutineModel(
      day: 'Monday',
      subject: 'English Communication',
      time: '10:30 AM - 11:30 AM',
      room: 'Room 204',
      teacher: 'Mr. Karim',
    ),
    RoutineModel(
      day: 'Tuesday',
      subject: 'Physics',
      time: '11:45 AM - 12:45 PM',
      room: 'Room 108',
      teacher: 'Dr. Hasan',
    ),
    RoutineModel(
      day: 'Wednesday',
      subject: 'Database Systems',
      time: '01:30 PM - 02:30 PM',
      room: 'Lab 1',
      teacher: 'Ms. Jahan',
    ),
    RoutineModel(
      day: 'Thursday',
      subject: 'Tutorial Session',
      time: '02:45 PM - 03:30 PM',
      room: 'Room 105',
      teacher: 'Department Office',
    ),
  ];

  void selectDay(int index) {
    selectedDayIndex.value = index;
  }

  List<RoutineModel> get visibleRoutines {
    final selectedDay = days[selectedDayIndex.value];

    return routines.where((routine) => routine.day == selectedDay).toList();
  }
}
