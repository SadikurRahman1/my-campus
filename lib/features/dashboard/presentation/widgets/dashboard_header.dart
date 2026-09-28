import 'package:my_campus/core/exported_files/core_export.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.find<DashboardController>();
    return Row(
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: AppColors.primarySoft,
          child: Icon(Icons.person_rounded, color: AppColors.secondary),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(dashboardController.getGreeting()),
              // Text(
              //   'Good Morning 👋',
              //   style: Theme.of(context).textTheme.bodyMedium,
              // ),
              const SizedBox(height: 3),
              Text(
                'Sadikur Rahman',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),

        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none_rounded,
            color: AppColors.secondary,
          ),
        ),
      ],
    );
  }
}
