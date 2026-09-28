import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor:
              Theme.of(context).colorScheme.primaryContainer,
          child: Icon(
            Icons.person_rounded,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Morning 👋',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 3),
              Text(
                'Sadikur Rahman',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),

        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none_rounded,
          ),
        ),
      ],
    );
  }
}