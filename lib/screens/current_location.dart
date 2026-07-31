import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modern_world_clock/providers/toggle_colors.dart';
import 'package:modern_world_clock/widgets/hero_section.dart';

class CurrentLocation extends ConsumerWidget {
  const CurrentLocation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: BoxBorder.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(Icons.access_time_outlined),
                  ),

                  Container(
                    width: 128,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Color(0xffE0DFDE),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Consumer(
                      builder: (context, ref, child) {
                        var toggle = ref.watch(toggleColorProvider);
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                ref
                                    .read(toggleColorProvider.notifier)
                                    .update((state) => !state);
                              },
                              child: Container(
                                width: 59,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: toggle
                                      ? Colors.black
                                      : Color(0xffE0DFDE),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Text(
                                    "24H",
                                    style: TextStyle(
                                      color: toggle
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                ref
                                    .read(toggleColorProvider.notifier)
                                    .update((state) => !state);
                              },
                              child: Container(
                                width: 59,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: toggle
                                      ? Color(0xffE0DFDE)
                                      : Colors.black,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Text(
                                    "12H",
                                    style: TextStyle(
                                      color: toggle
                                          ? Colors.black
                                          : Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const HeroSection(),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Current Location",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "My current location is set to the device's GPS coordinates. This allows the app to display the local time and date accurately based on where I am in the world.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.wb_sunny_outlined,
                        color: Colors.orange,
                        size: 36,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "SOLAR DURATION",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              letterSpacing: 1.0,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "10h 06m",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Sunrise — 07:12",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "Sunset — 17:17",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
