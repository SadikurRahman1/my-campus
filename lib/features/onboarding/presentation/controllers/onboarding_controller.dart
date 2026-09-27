import 'package:my_campus/core/exported_files/core_export.dart';



class OnboardingController extends GetxController {
  final PageController pageController = PageController();

  final currentPage = 0.obs;

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    final isLastPage =
        currentPage.value == OnboardingConstants.items.length - 1;

    if (isLastPage) {
      _goToLogin();
      return;
    }

    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void skip() {
    _goToLogin();
  }

  void _goToLogin() {
    // Get.offNamed(AppRoutes.login);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}