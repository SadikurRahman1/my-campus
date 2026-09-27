import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_header.dart';

class VerificationPage extends GetView<AuthController> {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final otpController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 40),

              const AuthHeader(
                title: 'Verify Your Account',
                subtitle:
                    'Enter the 6-digit verification code sent to your email.',
              ),

              const SizedBox(height: 48),

              TextField(
                controller: otpController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: const InputDecoration(
                  hintText: '000000',
                  counterText: '',
                ),
              ),

              const SizedBox(height: 32),

              Obx(
                () => AuthButton(
                  text: 'Verify',
                  onPressed: controller.verifyOtp,
                  isLoading: controller.isLoading.value,
                ),
              ),

              const SizedBox(height: 16),

              TextButton(
                onPressed: () {},
                child: const Text('Resend Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}