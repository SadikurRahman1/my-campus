import 'package:flutter/material.dart';

import 'package:my_campus/core/constants/app_colors.dart';

class NoticeCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;

  const NoticeCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.dashboardSurface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.dashboardOutline,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: AppColors.dashboardSurfaceAlt,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.campaign_rounded,
              color: AppColors.dashboardAccent,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall,
                ),

                const SizedBox(height: 8),

                Text(
                  date,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: AppColors.dashboardAccent,
                    fontWeight: FontWeight.w600,
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