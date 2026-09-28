import 'package:flutter/material.dart';
import 'package:my_campus/core/constants/app_colors.dart';

class RoutineDaySelector extends StatelessWidget {
  final List<String> days;
  final int selectedIndex;
  final ValueChanged<int> onDaySelected;

  const RoutineDaySelector({
    super.key,
    required this.days,
    required this.selectedIndex,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;

          return ChoiceChip(
            label: Text(days[index]),
            selected: isSelected,
            selectedColor: AppColors.primarySoft,
            backgroundColor: AppColors.surface,
            labelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: isSelected ? AppColors.secondary : AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
            side: BorderSide(
              color: isSelected ? AppColors.secondary : AppColors.border,
            ),
            onSelected: (_) => onDaySelected(index),
          );
        },
      ),
    );
  }
}
