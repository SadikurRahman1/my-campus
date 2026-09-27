import 'package:my_campus/core/exported_files/core_export.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();

    print('SPLASH CONTROLLER READY');

    _initializeApp();
  }

  Future<void> _initializeApp() async {
    print('SPLASH INIT');

    await Future.delayed(const Duration(seconds: 2));

    print('SPLASH TIMER DONE');

    Get.offAllNamed(AppRoutes.onboarding);

    print('NAVIGATION CALLED');
  }
}
