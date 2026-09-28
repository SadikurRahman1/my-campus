import 'package:my_campus/core/exported_files/core_export.dart';
import 'package:my_campus/features/navigation/presentation/widgets/bottom_nav_bar.dart';

class MainNavigationPage extends GetView<NavigationController> {
  const MainNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          DashboardPage(),
          RoutinePage(),
          AttendancePage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => AppBottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onItemSelected: controller.changePage,
        ),
      ),
    );
  }
}
