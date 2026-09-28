

import 'package:my_campus/core/exported_files/core_export.dart';

class ProfileController extends GetxController {
  void editProfile() {
    // TODO: Navigate to edit profile page
  }

  void changePassword() {
    Get.toNamed(AppRoutes.createNewPassword);
  }

  void logout() {
    Get.dialog(
      AppConfirmationDialog(
        title: 'Logout?',
        message: 'Are you sure you want to log out from your account?',
        confirmText: 'Logout',
        cancelText: 'Cancel',
        icon: Icons.logout_rounded,
        accentColor: AppColors.error,
        onCancel: Get.back,
        onConfirm: () {
          Get.back();
          Get.offAllNamed(AppRoutes.login);
        },
      ),
    );
  }
}