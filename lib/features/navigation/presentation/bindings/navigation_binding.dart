import 'package:my_campus/core/exported_files/core_export.dart';


class NavigationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(() => NavigationController());

    Get.lazyPut<DashboardController>(() => DashboardController());

    Get.lazyPut<RoutineController>(() => RoutineController());

    Get.lazyPut<AttendanceController>(() => AttendanceController());

    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
