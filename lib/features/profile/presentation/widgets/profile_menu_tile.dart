import 'package:flutter/material.dart';

class ProfileMenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final Color? iconColor;

  const ProfileMenuTile({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 4,
      ),
      leading: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          color: (iconColor ?? theme.colorScheme.primary)
              .withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: iconColor ?? theme.colorScheme.primary,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: subtitle != null
          ? Text(subtitle!)
          : null,
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16,
      ),
    );
  }
}