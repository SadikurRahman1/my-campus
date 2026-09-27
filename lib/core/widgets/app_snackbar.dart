import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';

class AppSnackbar {
  AppSnackbar._();

  static void success({
    required String title,
    required String message,
  }) {
    _show(
      title: title,
      message: message,
      icon: Icons.check_circle_rounded,
      color: AppColors.success,
    );
  }

  static void error({
    required String title,
    required String message,
  }) {
    _show(
      title: title,
      message: message,
      icon: Icons.error_rounded,
      color: AppColors.error,
    );
  }

  static void warning({
    required String title,
    required String message,
  }) {
    _show(
      title: title,
      message: message,
      icon: Icons.warning_rounded,
      color: AppColors.warning,
    );
  }

  static void info({
    required String title,
    required String message,
  }) {
    _show(
      title: title,
      message: message,
      icon: Icons.info_rounded,
      color: AppColors.info,
    );
  }

  static void _show({
    required String title,
    required String message,
    required IconData icon,
    required Color color,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      borderRadius: 16,
      backgroundColor: AppColors.white,
      colorText: AppColors.textPrimary,
      icon: Icon(
        icon,
        color: color,
        size: 28,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 300),
      shouldIconPulse: false,
      boxShadows: const [
        BoxShadow(
          blurRadius: 12,
          offset: Offset(0, 4),
          color: Colors.black12,
        ),
      ],
    );
  }
}