import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_text_field.dart';

class ForgotPasswordPage extends GetView<AuthController> {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: controller.forgotPasswordFormKey,
            child: Column(
              children: [
                const SizedBox(height: 40),

                const AuthHeader(
                  title: 'Forgot Password?',
                  subtitle:
                      'Enter your email and we will send you a verification code.',
                ),

                const SizedBox(height: 48),

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

                const SizedBox(height: 32),

                Obx(
                  () => AuthButton(
                    text: 'Send Code',
                    onPressed: controller.forgotPassword,
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