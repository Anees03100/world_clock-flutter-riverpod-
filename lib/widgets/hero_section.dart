import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modern_world_clock/providers/locations_provider.dart';
import 'package:modern_world_clock/providers/toggle_colors.dart';

class HeroSection extends ConsumerWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locations = ref.watch(locationProvider);
    final is24Hour = ref.watch(toggleColorProvider);

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

    int currentSec = now.second;
    int prevSec = currentSec == 0 ? 59 : currentSec - 1; // Decrement
    int nextSec = currentSec == 59 ? 0 : currentSec + 1; // Increment

    String currentSecStr = currentSec.toString().padLeft(2, '0');
    String prevSecStr = prevSec.toString().padLeft(2, '0');
    String nextSecStr = nextSec.toString().padLeft(2, '0');

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
              style: const TextStyle(
                fontSize: 118,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              minute,
              style: const TextStyle(
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
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
              date,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            Container(
              width: 80,
              height: 148,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    spreadRadius: 1,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    prevSecStr,
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade400),
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    height: 24,
                  ),
                  Text(
                    currentSecStr,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    height: 24,
                  ),
                  Text(
                    nextSecStr,
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
