import 'package:flutter/material.dart';

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
            onSelected: (_) => onDaySelected(index),
          );
        },
      ),
    );
  }
}
