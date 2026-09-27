import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_text_field.dart';

class CreateNewPasswordPage extends GetView<AuthController> {
  const CreateNewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Password'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: controller.resetPasswordFormKey,
            child: Column(
              children: [
                const SizedBox(height: 40),

                const AuthHeader(
                  title: 'Create New Password',
                  subtitle:
                      'Create a new password for your account.',
                ),

                const SizedBox(height: 48),

                Obx(
                  () => AuthTextField(
                    controller: controller.passwordController,
                    label: 'New Password',
                    hint: 'Enter new password',
                    prefixIcon: Icons.lock_outline,
                    obscureText:
                        !controller.isPasswordVisible.value,
                    suffixIcon: controller.isPasswordVisible.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    onSuffixTap:
                        controller.togglePasswordVisibility,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }

                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }

                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 16),

                Obx(
                  () => AuthTextField(
                    controller: controller.confirmPasswordController,
                    label: 'Confirm Password',
                    hint: 'Re-enter new password',
                    prefixIcon: Icons.lock_outline,
                    obscureText:
                        !controller.isConfirmPasswordVisible.value,
                    suffixIcon:
                        controller.isConfirmPasswordVisible.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                    onSuffixTap:
                        controller.toggleConfirmPasswordVisibility,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }

                      if (value !=
                          controller.passwordController.text) {
                        return 'Passwords do not match';
                      }

                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 32),

                Obx(
                  () => AuthButton(
                    text: 'Reset Password',
                    onPressed: controller.resetPassword,
                    isLoading: controller.isLoading.value,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}