import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';
import '../widgets/dashboard_banner.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/notice_card.dart';
import '../widgets/quick_action_card.dart';
import '../widgets/upcoming_event_card.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                20,
                20,
                20,
                32,
              ),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const DashboardHeader(),

                    const SizedBox(height: 24),

                    const DashboardBanner(),

                    const SizedBox(height: 28),

                    _sectionTitle(
                      context,
                      title: 'Quick Access',
                      actionText: 'See all',
                      onAction: () {},
                    ),

                    const SizedBox(height: 14),

                    _quickActions(),

                    const SizedBox(height: 28),

                    _sectionTitle(
                      context,
                      title: 'Latest Notices',
                      actionText: 'View all',
                      onAction: () {},
                    ),

                    const SizedBox(height: 14),

                    const NoticeCard(
                      title: 'Mid-Term Examination Schedule',
                      description:
                          'The mid-term examination schedule has been published.',
                      date: '28 Sep 2026',
                    ),

                    const SizedBox(height: 12),

                    const NoticeCard(
                      title: 'Campus Closed on Thursday',
                      description:
                          'The campus will remain closed due to a public holiday.',
                      date: '27 Sep 2026',
                    ),

                    const SizedBox(height: 28),

                    _sectionTitle(
                      context,
                      title: 'Upcoming Events',
                      actionText: 'View all',
                      onAction: () {},
                    ),

                    const SizedBox(height: 14),

                    const UpcomingEventCard(
                      title: 'Tech Fest 2026',
                      date: '05 Oct 2026',
                      time: '10:00 AM',
                      location: 'University Auditorium',
                    ),

                    const SizedBox(height: 12),

                    const UpcomingEventCard(
                      title: 'Career Workshop',
                      date: '10 Oct 2026',
                      time: '02:00 PM',
                      location: 'Seminar Hall',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _quickActions() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.quickActions.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.55,
      ),
      itemBuilder: (context, index) {
        final item = controller.quickActions[index];

        return QuickActionCard(
          item: item,
          onTap: () => controller.handleQuickActionTap(item),
        );
      },
    );
  }

  Widget _sectionTitle(
    BuildContext context, {
    required String title,
    required String actionText,
    required VoidCallback onAction,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        TextButton(
          onPressed: onAction,
          child: Text(actionText),
        ),
      ],
    );
  }
}