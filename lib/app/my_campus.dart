import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/core/routes/app_pages.dart';
import 'package:my_campus/core/routes/app_routes.dart';
import 'package:my_campus/core/theme/app_theme.dart';


class MyCampus extends StatelessWidget {
  const MyCampus({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyCampus',

      theme: AppTheme.lightTheme,

      initialRoute: AppRoutes.splash,
      getPages: AppPages.routes,
    );
  }
}