import 'package:flutter/material.dart';
import 'package:my_campus/core/constants/app_colors.dart';

class AssignmentHeaderCard extends StatelessWidget {
  const AssignmentHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
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
              color: AppColors.white.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.assignment_rounded,
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
                  'Stay on top of your tasks',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Track pending, submitted, and completed assignments in one place.',
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
