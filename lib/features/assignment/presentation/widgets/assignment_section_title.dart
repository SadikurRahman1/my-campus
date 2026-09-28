import 'package:flutter/material.dart';

class AssignmentSectionTitle extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback onPressed;

  const AssignmentSectionTitle({
    super.key,
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
