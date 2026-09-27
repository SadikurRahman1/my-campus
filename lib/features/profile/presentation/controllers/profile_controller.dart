

import 'package:my_campus/core/exported_files/core_export.dart';

class ProfileController extends GetxController {
  void editProfile() {
    // TODO: Navigate to edit profile page
  }

  void changePassword() {
    Get.toNamed(AppRoutes.createNewPassword);
  }

  void logout() {
    Get.offAllNamed(AppRoutes.login);
  }
}