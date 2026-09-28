import 'package:flutter/material.dart';
import 'package:my_campus/core/constants/app_colors.dart';

import '../../data/models/attendance_model.dart';
import 'attendance_progress.dart';

class AttendanceSubjectCard extends StatelessWidget {
  final AttendanceSubjectModel subject;
  final bool selected;
  final VoidCallback onTap;

  const AttendanceSubjectCard({
    super.key,
    required this.subject,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final borderColor = selected ? AppColors.primary : colorScheme.outlineVariant.withValues(alpha: 0.5);
    final surfaceColor = selected ? AppColors.primary.withValues(alpha: 0.06) : colorScheme.surface;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        width: 260,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: surfaceColor,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: borderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    subject.subject,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
                if (selected)
                  Icon(
                    Icons.check_circle,
                    size: 18,
                    color: AppColors.primary,
                  ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              subject.teacher,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              subject.schedule,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              subject.room,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 14),
            AttendanceProgress(
              progress: subject.progress,
              label: '${subject.attendedClasses}/${subject.totalClasses} classes attended',
              valueLabel: '${(subject.progress * 100).round()}%',
            ),
          ],
        ),
      ),
    );
  }
}
