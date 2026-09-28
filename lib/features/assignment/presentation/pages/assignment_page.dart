import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/assignment_controller.dart';
import '../widgets/assignment_header_card.dart';
import '../widgets/assignment_section_title.dart';
import '../widgets/assignment_stat_card.dart';
import '../widgets/assignment_tile.dart';

class AssignmentPage extends GetView<AssignmentController> {
  const AssignmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignments'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
          children: [
            const AssignmentHeaderCard(),
            const SizedBox(height: 20),
            Obx(
              () => Row(
                children: [
                  Expanded(
                    child: AssignmentStatCard(
                      title: 'Total',
                      value: '${controller.totalAssignments.value}',
                      icon: Icons.assignment_outlined,
                      accentColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AssignmentStatCard(
                      title: 'Pending',
                      value: '${controller.pendingAssignments.value}',
                      icon: Icons.schedule_rounded,
                      accentColor: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AssignmentStatCard(
                      title: 'Done',
                      value: '${controller.completedAssignments.value}',
                      icon: Icons.check_circle_rounded,
                      accentColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            AssignmentSectionTitle(
              title: 'Due Soon',
              actionText: 'View all',
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            const AssignmentTile(
              title: 'Database Design Report',
              course: 'Database Systems',
              deadline: 'Due tomorrow, 11:59 PM',
              progress: 0.7,
              statusText: 'In Progress',
              statusColor: Color(0xFFF59E0B),
            ),
            const SizedBox(height: 12),
            const AssignmentTile(
              title: 'Mobile App UI Redesign',
              course: 'Software Engineering',
              deadline: 'Due 02 Oct 2026',
              progress: 0.4,
              statusText: 'Pending',
              statusColor: Color(0xFFEF4444),
            ),
            const SizedBox(height: 24),
            AssignmentSectionTitle(
              title: 'Completed',
              actionText: 'See history',
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            const AssignmentTile(
              title: 'Chapter 3 Quiz Submission',
              course: 'English Communication',
              deadline: 'Submitted 25 Sep 2026',
              progress: 1,
              statusText: 'Completed',
              statusColor: Color(0xFF10B981),
            ),
          ],
        ),
      ),
    );
  }
}
