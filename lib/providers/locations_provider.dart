import 'package:flutter_riverpod/legacy.dart';
import 'package:modern_world_clock/models/world_time.dart';
import 'dart:async';

class LocationManager extends StateNotifier<List<WorldTime>> {
  Timer? _timer;

  LocationManager()
    : super([
        WorldTime(
          url: 'Asia/Karachi',
          locationName: 'Karachi',
          image: 'pakistan.png',
        ),
        WorldTime(
          url: 'Europe/London',
          locationName: 'London',
          image: 'uk.png',
        ),
        WorldTime(
          url: 'Asia/Dubai',
          locationName: 'Dubai',
          image: 'pakistan.png',
        ),
        WorldTime(
          url: 'Asia/Kolkata',
          locationName: 'India',
          image: 'india.png',
        ),
        WorldTime(
          url: 'America/Toronto',
          locationName: 'Canada',
          image: 'canada.png',
        ),
        WorldTime(
          url: 'Asia/Karachi',
          locationName: 'Islamabad',
          image: 'pakistan.png',
        ),
      ]);

  Future<void> fetchAllTimes() async {
    for (int i = 0; i < state.length; i++) {
      await state[i].getTime();
    }
    state = [...state];

    startTimer();
  }

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      for (var city in state) {
        city.tick();
      }

      state = [...state];
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final locationProvider =
    StateNotifierProvider<LocationManager, List<WorldTime>>((ref) {
      return LocationManager();
    });
