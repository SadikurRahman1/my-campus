import 'package:my_campus/core/exported_files/core_export.dart';

class AppPages {
  AppPages._();

  static final List<GetPage<dynamic>> routes = [
    _page(
      name: AppRoutes.splash,
      page: const SplashPage(),
      binding: SplashBinding(),
    ),

    _page(
      name: AppRoutes.onboarding,
      page: const OnboardingPage(),
      binding: OnboardingBinding(),
    ),

    _page(
      name: AppRoutes.login,
      page: const LoginPage(),
      binding: AuthBinding(),
    ),

    _page(
      name: AppRoutes.registration,
      page: const RegistrationPage(),
      binding: AuthBinding(),
    ),

    _page(
      name: AppRoutes.verification,
      page: const VerificationPage(),
      binding: AuthBinding(),
    ),
    _page(
      name: AppRoutes.forgotPassword,
      page: const ForgotPasswordPage(),
      binding: AuthBinding(),
    ),

    _page(
      name: AppRoutes.createNewPassword,
      page: const CreateNewPasswordPage(),
      binding: AuthBinding(),
    ),

    _page(
      name: AppRoutes.main,
      page: const MainNavigationPage(),
      binding: NavigationBinding(),
    ),

    
  ];

  static GetPage<dynamic> _page({
    required String name,
    required Widget page,
    Bindings? binding,
  }) {
    return GetPage(name: name, page: () => page, binding: binding);
  }
}
