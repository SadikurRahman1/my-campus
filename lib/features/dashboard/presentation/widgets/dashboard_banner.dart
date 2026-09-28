import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_campus/core/constants/app_colors.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBanner extends GetView<DashboardController> {
  const DashboardBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final banners = [
      (
        title: 'Stay Connected',
        subtitle: 'Everything you need for your campus life.',
        icon: Icons.school_rounded,
      ),
      (
        title: 'Never Miss a Class',
        subtitle: 'Check your routine and attendance easily.',
        icon: Icons.calendar_month_rounded,
      ),
      (
        title: 'Track Your Progress',
        subtitle: 'View your results and academic performance.',
        icon: Icons.bar_chart_rounded,
      ),
    ];

    return Column(
      children: [
        SizedBox(
          height: 170,
          child: PageView.builder(
            controller: controller.bannerController,
            itemCount: banners.length,
            onPageChanged: controller.onBannerChanged,
            itemBuilder: (context, index) {
              final banner = banners[index];

              return Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.dashboardBannerStart,
                      AppColors.dashboardBannerEnd,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            banner.title,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            banner.subtitle,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: AppColors.white.withValues(alpha: 0.78),
                                ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      banner.icon,
                      size: 60,
                        color: AppColors.white.withValues(alpha: 0.9),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 12),

        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              banners.length,
              (index) {
                final isActive =
                    controller.currentBannerIndex.value == index;

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  height: 6,
                  width: isActive ? 20 : 6,
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColors.dashboardAccent
                        : AppColors.dashboardOutline,
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}