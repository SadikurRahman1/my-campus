import 'package:flutter/material.dart';
import 'package:my_campus/core/constants/app_colors.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  final String studentId;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.email,
    required this.studentId,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        CircleAvatar(
          radius: 48,
          backgroundColor: AppColors.dashboardSurfaceAlt,
          child: Icon(
            Icons.person_rounded,
            size: 52,
            color: AppColors.dashboardAccent,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          name,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          email,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Student ID: $studentId',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}