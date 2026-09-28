import 'package:flutter/material.dart';
import 'package:my_campus/core/constants/app_colors.dart';

import '../../data/models/routine_model.dart';

class RoutineCard extends StatelessWidget {
  final RoutineModel routine;

  const RoutineCard({
    super.key,
    required this.routine,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.dashboardSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.dashboardOutline,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.dashboardSurfaceAlt,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  Icons.schedule,
                  color: AppColors.dashboardAccent,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      routine.subject,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      routine.day,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _DetailRow(label: 'Time', value: routine.time),
          const SizedBox(height: 8),
          _DetailRow(label: 'Room', value: routine.room),
          const SizedBox(height: 8),
          _DetailRow(label: 'Teacher', value: routine.teacher),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 72,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
