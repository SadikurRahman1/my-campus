import 'package:my_campus/core/exported_files/core_export.dart';

class AppPages {
  AppPages._();

  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingPage(),
      binding: OnboardingBinding(),
    ),

    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: AppRoutes.registration,
      page: () => const RegistrationPage(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: AppRoutes.verification,
      page: () => const VerificationPage(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordPage(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: AppRoutes.createNewPassword,
      page: () => const CreateNewPasswordPage(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: AppRoutes.main,
      page: () => const MainNavigationPage(),
      binding: NavigationBinding(),
    ),

    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),

    GetPage(
      name: AppRoutes.routine,
      page: () => const RoutinePage(),
      binding: RoutineBinding(),
    ),

    GetPage(
      name: AppRoutes.attendance,
      page: () => const AttendancePage(),
      binding: AttendanceBinding(),
    ),
  ];
}
