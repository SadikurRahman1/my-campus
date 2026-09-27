import 'package:get/get.dart';
import 'package:my_campus/features/auth/presentation/controllers/auth_controller.dart';


class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}