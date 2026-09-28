import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/core/exported_files/core_export.dart';
import 'package:my_campus/features/dashboard/data/models/dashboard_menu_model.dart';


class DashboardController extends GetxController {
  final currentBannerIndex = 0.obs;

  final PageController bannerController = PageController();

  final quickActions = const [
    DashboardMenuModel(
      title: 'Attendance',
      subtitle: 'Check attendance',
      icon: 'calendar',
      route: '',
    ),
    DashboardMenuModel(
      title: 'Routine',
      subtitle: 'Class schedule',
      icon: 'schedule',
      route: '',
    ),
    DashboardMenuModel(
      title: 'Results',
      subtitle: 'View results',
      icon: 'result',
      route: '',
    ),
    DashboardMenuModel(
      title: 'Assignments',
      subtitle: 'Your assignments',
      icon: 'assignment',
      route: AppRoutes.assignment,
    ),
    DashboardMenuModel(
      title: 'Notices',
      subtitle: 'Latest notices',
      icon: 'notice',
      route: '',
    ),
    DashboardMenuModel(
      title: 'Events',
      subtitle: 'Campus events',
      icon: 'event',
      route: '',
    ),
  ];

  void onBannerChanged(int index) {
    currentBannerIndex.value = index;
  }

  void handleQuickActionTap(DashboardMenuModel item) {
    if (item.route.isEmpty) {
      return;
    }

    Get.toNamed(item.route);
  }

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Good Morning 👋';
    }

    if (hour < 17) {
      return 'Good Afternoon ☀️';
    }

    if (hour < 21) {
      return 'Good Evening 🌤️';
    }

    return 'Welcome Back 🌙';
  }

  @override
  void onClose() {
    bannerController.dispose();
    super.onClose();
  }
}