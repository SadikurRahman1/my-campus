import 'package:flutter/material.dart';

import 'package:my_campus/core/constants/app_colors.dart';

import '../../data/models/dashboard_menu_model.dart';

class QuickActionCard extends StatelessWidget {
  final DashboardMenuModel item;
  final VoidCallback onTap;

  const QuickActionCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  IconData _getIcon() {
    switch (item.icon) {
      case 'calendar':
        return Icons.calendar_month_rounded;
      case 'schedule':
        return Icons.schedule_rounded;
      case 'result':
        return Icons.assessment_rounded;
      case 'assignment':
        return Icons.assignment_rounded;
      case 'notice':
        return Icons.campaign_rounded;
      case 'event':
        return Icons.event_rounded;
      default:
        return Icons.apps_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: AppColors.border,
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                color: AppColors.primarySoft,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                _getIcon(),
                color: AppColors.secondary,
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    item.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}