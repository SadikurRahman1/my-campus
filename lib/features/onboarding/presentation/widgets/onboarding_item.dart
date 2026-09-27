import 'package:my_campus/core/exported_files/core_export.dart';


class OnboardingItem extends StatelessWidget {
  final OnboardingItemData data;

  const OnboardingItem({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon
          Container(
            height: 180,
            width: 180,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.08),
              shape: BoxShape.circle,
            ),
            child: Icon(
              data.icon,
              size: 90,
              color: theme.colorScheme.primary,
            ),
          ),

          const SizedBox(height: 48),

          // Title
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          // Description
          Text(
            data.description,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge?.copyWith(
              height: 1.5,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}