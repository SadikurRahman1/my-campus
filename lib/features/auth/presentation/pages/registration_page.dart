import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_text_field.dart';

class RegistrationPage extends GetView<AuthController> {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: controller.registrationFormKey,
            child: Column(
              children: [
                const SizedBox(height: 24),

                const AuthHeader(
                  title: 'Create Account',
                  subtitle:
                      'Create your MyCampus account to get started.',
                ),

                const SizedBox(height: 40),

                AuthTextField(
                  controller: controller.nameController,
                  label: 'Full Name',
                  hint: 'Enter your full name',
                  prefixIcon: Icons.person_outline,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                AuthTextField(
                  controller: controller.emailController,
                  label: 'Email',
                  hint: 'Enter your email',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    }

                    if (!GetUtils.isEmail(value.trim())) {
                      return 'Please enter a valid email';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                Obx(
                  () => AuthTextField(
                    controller: controller.passwordController,
                    label: 'Password',
                    hint: 'Create a password',
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
                    hint: 'Re-enter your password',
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
                    text: 'Create Account',
                    onPressed: controller.register,
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