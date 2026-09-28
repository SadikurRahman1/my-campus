import 'package:my_campus/core/exported_files/core_export.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed(AppRoutes.onboarding);
  }
}
