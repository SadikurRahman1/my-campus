import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/routine_controller.dart';
import '../widgets/routine_card.dart';
import '../widgets/routine_day_selector.dart';

class RoutinePage extends GetView<RoutineController> {
  const RoutinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routine'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select a day',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 12),
              Obx(
                () => RoutineDaySelector(
                  days: controller.days,
                  selectedIndex: controller.selectedDayIndex.value,
                  onDaySelected: controller.selectDay,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Obx(
                  () {
                    final routines = controller.visibleRoutines;

                    if (routines.isEmpty) {
                      return Center(
                        child: Text(
                          'No classes scheduled for this day.',
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      );
                    }

                    return ListView.separated(
                      itemCount: routines.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        return RoutineCard(routine: routines[index]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
