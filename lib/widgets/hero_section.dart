import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modern_world_clock/providers/locations_provider.dart';
import 'package:modern_world_clock/providers/toggle_colors.dart';

class HeroSection extends ConsumerWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locations = ref.watch(locationProvider);
    final is24Hour = ref.watch(toggleColorProvider); // false = 12H, true = 24H
    if (locations.isEmpty || locations.first.currentDateTime == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final DateTime now = locations.first.currentDateTime!;

    int hourInt = now.hour;
    if (!is24Hour) {
      hourInt = hourInt > 12 ? hourInt - 12 : hourInt;
      if (hourInt == 0) hourInt = 12;
    }
    String hour = hourInt < 10 ? '0$hourInt' : '$hourInt';

    String minute = now.minute < 10 ? '0${now.minute}' : '${now.minute}';
    String second = now.second < 10 ? '0${now.second}' : '${now.second}';

    const weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    String weekday = weekdays[now.weekday - 1];
    String date = '${now.day} ${months[now.month - 1]}';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hour,
              style: TextStyle(fontSize: 118, fontWeight: FontWeight.bold),
            ),
            Text(
              minute,
              style: TextStyle(
                fontSize: 118,
                fontWeight: FontWeight.bold,
                height: 0.1,
              ),
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,

          children: [
            Text(
              weekday,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
              date,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              width: 80,
              height: 148,
              decoration: BoxDecoration(
                color: Color(0xffE0DFDE),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  second,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
