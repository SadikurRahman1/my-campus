import '../controllers/onboarding_controller.dart';
import '../widgets/onboarding_indicator.dart';
import '../widgets/onboarding_item.dart';
import 'package:my_campus/core/exported_files/core_export.dart';


class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: controller.skip,
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    color: AppColors.secondary,
                  ),
                ),
              ),
            ),

            // Onboarding Content
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: OnboardingConstants.items.length,
                onPageChanged: controller.onPageChanged,
                itemBuilder: (context, index) {
                  return OnboardingItem(
                    data: OnboardingConstants.items[index],
                  );
                },
              ),
            ),

            // Indicator
            Obx(
              () => OnboardingIndicator(
                count: OnboardingConstants.items.length,
                currentIndex: controller.currentPage.value,
              ),
            ),

            const SizedBox(height: 32),

            // Continue / Get Started Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: Obx(
                  () {
                    final isLastPage =
                        controller.currentPage.value ==
                            OnboardingConstants.items.length - 1;

                    return ElevatedButton(
                      onPressed: controller.nextPage,
                      child: Text(
                        isLastPage ? 'Get Started' : 'Continue',
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}