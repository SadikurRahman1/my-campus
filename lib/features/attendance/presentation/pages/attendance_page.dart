import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/core/constants/app_colors.dart';

import '../../data/models/attendance_model.dart';
import '../controllers/attendance_controller.dart';
import '../widgets/attendance_progress.dart';
import '../widgets/attendance_subject_card.dart';
import '../widgets/attendance_summary_card.dart';

class AttendancePage extends GetView<AttendanceController> {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
          children: [
            _HeaderCard(colorScheme: colorScheme),
            const SizedBox(height: 20),
            _SectionTitle(
              title: 'Today Summary',
              actionText: 'View report',
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            Row(
              children: List.generate(
                controller.summaries.length,
                (index) {
                  final summary = controller.summaries[index];

                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: index == controller.summaries.length - 1 ? 0 : 12,
                      ),
                      child: AttendanceSummaryCard(summary: summary),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            _SectionTitle(
              title: 'Attendance Progress',
              actionText: 'Manage',
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            GetBuilder<AttendanceController>(
              builder: (controller) {
                return Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                    ),
                  ),
                  child: AttendanceProgress(
                    progress: controller.overallProgress,
                    label: controller.selectedSubject.subject,
                    valueLabel: controller.overallProgressLabel,
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            _SectionTitle(
              title: 'Subjects',
              actionText: 'View all',
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            GetBuilder<AttendanceController>(
              builder: (controller) {
                return SizedBox(
                  height: 250,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.subjects.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final subject = controller.subjects[index];

                      return AttendanceSubjectCard(
                        subject: subject,
                        selected: controller.selectedSubjectIndex == index,
                        onTap: () => controller.selectSubject(index),
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            _SectionTitle(
              title: 'Class List',
              actionText: 'Export',
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            ...controller.records.map(
              (record) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _AttendanceTile(record: record),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  final ColorScheme colorScheme;

  const _HeaderCard({required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.secondary,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.fact_check_outlined,
              color: AppColors.white,
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daily Attendance',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Track presence, late entries, and absences for today.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.white.withValues(alpha: 0.9),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback onPressed;

  const _SectionTitle({
    required this.title,
    required this.actionText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(actionText),
        ),
      ],
    );
  }
}

class _AttendanceTile extends StatelessWidget {
  final AttendanceModel record;

  const _AttendanceTile({required this.record});

  @override
  Widget build(BuildContext context) {
    final statusColor = switch (record.status) {
      AttendanceStatus.present => AppColors.attendancePresent,
      AttendanceStatus.late => AppColors.attendanceLate,
      AttendanceStatus.absent => AppColors.attendanceAbsent,
    };

    final statusLabel = switch (record.status) {
      AttendanceStatus.present => 'Present',
      AttendanceStatus.late => 'Late',
      AttendanceStatus.absent => 'Absent',
    };

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: statusColor.withValues(alpha: 0.12),
            child: Icon(
              Icons.person_outline,
              color: statusColor,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  record.name,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  record.roll,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                statusLabel,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: statusColor,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                record.time,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
