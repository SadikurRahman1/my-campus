import 'package:my_campus/core/exported_files/core_export.dart';


class AuthController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final registrationFormKey = GlobalKey<FormState>();
  final forgotPasswordFormKey = GlobalKey<FormState>();
  final resetPasswordFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;
  final isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.toggle();
  }

  Future<void> login() async {
    if (!loginFormKey.currentState!.validate()) return;

    isLoading.value = true;

    await Future.delayed(
      const Duration(seconds: 1),
    );

    isLoading.value = false;

    AppSnackbar.success(
      title: 'Login Successful',
      message: 'Welcome back to MyCampus.',
    );

    Get.offAllNamed(AppRoutes.main);
  }

  Future<void> register() async {
    if (!registrationFormKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    await Future.delayed(
      const Duration(seconds: 1),
    );

    isLoading.value = false;

    AppSnackbar.success(
      title: 'Account Created',
      message: 'Your account has been created successfully.',
    );

    Get.toNamed(AppRoutes.verification);
  }

  Future<void> forgotPassword() async {
    if (!forgotPasswordFormKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    await Future.delayed(
      const Duration(seconds: 1),
    );

    isLoading.value = false;

    AppSnackbar.info(
      title: 'Verification Code Sent',
      message: 'Please check your email for the verification code.',
    );

    Get.toNamed(AppRoutes.verification);
  }

  Future<void> verifyOtp() async {
    isLoading.value = true;

    await Future.delayed(
      const Duration(seconds: 1),
    );

    isLoading.value = false;

    AppSnackbar.success(
      title: 'Verified',
      message: 'Your account has been verified successfully.',
    );

    Get.toNamed(AppRoutes.createNewPassword);
  }

  Future<void> resetPassword() async {
    if (!resetPasswordFormKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    await Future.delayed(
      const Duration(seconds: 1),
    );

    isLoading.value = false;

    AppSnackbar.success(
      title: 'Password Reset',
      message: 'Your password has been reset successfully.',
    );

    Get.offAllNamed(AppRoutes.login);
  }

  void showLoginError() {
    AppSnackbar.error(
      title: 'Login Failed',
      message: 'Invalid email or password.',
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();

    super.onClose();
  }
}