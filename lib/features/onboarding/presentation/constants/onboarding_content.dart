import 'package:flutter/material.dart';

class OnboardingItemData {
  final String title;
  final String description;
  final IconData icon;

  const OnboardingItemData({
    required this.title,
    required this.description,
    required this.icon,
  });
}

class OnboardingConstants {
  OnboardingConstants._();

  static const List<OnboardingItemData> items = [
    OnboardingItemData(
      title: 'Everything in One Place',
      description:
          'Stay connected with your campus life, academic information, and important updates.',
      icon: Icons.school_rounded,
    ),
    OnboardingItemData(
      title: 'Stay on Track',
      description:
          'Check your class routine, attendance, results, and assignments anytime.',
      icon: Icons.calendar_month_rounded,
    ),
    OnboardingItemData(
      title: 'Never Miss an Update',
      description:
          'Get important notices, events, and campus announcements right when you need them.',
      icon: Icons.notifications_active_rounded,
    ),
  ];
}