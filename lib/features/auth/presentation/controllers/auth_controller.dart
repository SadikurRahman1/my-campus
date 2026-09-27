import 'dart:async';

import 'package:my_campus/core/exported_files/core_export.dart';

class AuthController extends GetxController {
  // ============================================================
  // Forms
  // ============================================================

  final loginFormKey = GlobalKey<FormState>();
  final registrationFormKey = GlobalKey<FormState>();
  final forgotPasswordFormKey = GlobalKey<FormState>();
  final resetPasswordFormKey = GlobalKey<FormState>();

  // ============================================================
  // Text Controllers
  // ============================================================

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // ============================================================
  // OTP
  // ============================================================

  final List<TextEditingController> otpControllers =
      List.generate(
    4,
    (_) => TextEditingController(),
  );

  final List<FocusNode> otpFocusNodes =
      List.generate(
    4,
    (_) => FocusNode(),
  );

  Timer? _otpTimer;

  final otpSeconds = 60.obs;

  bool get canResendOtp => otpSeconds.value == 0;

  String get otp {
    return otpControllers
        .map((controller) => controller.text)
        .join();
  }

  void onOtpChanged(String value, int index) {
    // Move to next box
    if (value.isNotEmpty && index < 3) {
      otpFocusNodes[index + 1].requestFocus();
    }

    // Move to previous box when deleting
    if (value.isEmpty && index > 0) {
      otpFocusNodes[index - 1].requestFocus();
    }
  }

  // ============================================================
  // OTP Timer
  // ============================================================

  void startOtpTimer() {
    _otpTimer?.cancel();

    otpSeconds.value = 60;

    _otpTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (otpSeconds.value > 0) {
          otpSeconds.value--;
        } else {
          timer.cancel();
        }
      },
    );
  }

  void resendOtp() {
    if (!canResendOtp) {
      return;
    }

    // Clear OTP boxes
    for (final controller in otpControllers) {
      controller.clear();
    }

    // Focus first box
    otpFocusNodes.first.requestFocus();

    AppSnackbar.info(
      title: 'Code Sent',
      message: 'A new verification code has been sent.',
    );

    // Restart timer
    startOtpTimer();
  }

  // ============================================================
  // States
  // ============================================================

  final isPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;
  final isLoading = false.obs;

  // ============================================================
  // Password Visibility
  // ============================================================

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.toggle();
  }

  // ============================================================
  // Login
  // ============================================================

  Future<void> login() async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    await Future.delayed(
      const Duration(seconds: 1),
    );

    isLoading.value = false;

    FocusManager.instance.primaryFocus?.unfocus();

    AppSnackbar.success(
      title: 'Login Successful',
      message: 'Welcome back to MyCampus.',
    );

    Get.offAllNamed(AppRoutes.main);
  }

  // ============================================================
  // Registration
  // ============================================================

  Future<void> register() async {
    if (!registrationFormKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    await Future.delayed(
      const Duration(seconds: 1),
    );

    isLoading.value = false;

    FocusManager.instance.primaryFocus?.unfocus();

    AppSnackbar.success(
      title: 'Account Created',
      message: 'Your account has been created successfully.',
    );

    Get.toNamed(AppRoutes.verification);

    // Start OTP timer after opening verification screen
    startOtpTimer();
  }

  // ============================================================
  // Forgot Password
  // ============================================================

  Future<void> forgotPassword() async {
    if (!forgotPasswordFormKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    await Future.delayed(
      const Duration(seconds: 1),
    );

    isLoading.value = false;

    FocusManager.instance.primaryFocus?.unfocus();

    AppSnackbar.info(
      title: 'Verification Code Sent',
      message: 'Please check your email for the verification code.',
    );

    Get.toNamed(AppRoutes.verification);

    // Start OTP timer after opening verification screen
    startOtpTimer();
  }

  // ============================================================
  // Verify OTP
  // ============================================================

  Future<void> verifyOtp() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (otp.length != 4) {
      AppSnackbar.warning(
        title: 'Invalid Code',
        message: 'Please enter the 4-digit verification code.',
      );

      return;
    }

    isLoading.value = true;

    await Future.delayed(
      const Duration(seconds: 1),
    );

    isLoading.value = false;

    AppSnackbar.success(
      title: 'Verified',
      message: 'Your account has been verified successfully.',
    );

    Get.offNamed(
      AppRoutes.createNewPassword,
    );
  }

  // ============================================================
  // Reset Password
  // ============================================================

  Future<void> resetPassword() async {
    if (!resetPasswordFormKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    await Future.delayed(
      const Duration(seconds: 1),
    );

    isLoading.value = false;

    // Remove keyboard/focus before changing route
    FocusManager.instance.primaryFocus?.unfocus();

    AppSnackbar.success(
      title: 'Password Reset',
      message: 'Your password has been reset successfully.',
    );

    // Wait for current frame/keyboard transition
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    Get.offNamed(
      AppRoutes.login,
    );
  }

  // ============================================================
  // Login Error
  // ============================================================

  void showLoginError() {
    AppSnackbar.error(
      title: 'Login Failed',
      message: 'Invalid email or password.',
    );
  }

  // ============================================================
  // Controller Dispose
  // ============================================================

  @override
  void onClose() {
    // Cancel OTP timer
    _otpTimer?.cancel();

    // Dispose text controllers
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();

    // Dispose OTP controllers
    for (final controller in otpControllers) {
      controller.dispose();
    }

    // Dispose OTP focus nodes
    for (final focusNode in otpFocusNodes) {
      focusNode.dispose();
    }

    super.onClose();
  }
}