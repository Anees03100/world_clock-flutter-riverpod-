import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modern_world_clock/providers/toggle_colors.dart';

class CurrentLocation extends ConsumerWidget {
  const CurrentLocation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
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
                child: Icon(Icons.timer_outlined),
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
                              color: toggle ? Colors.black : Color(0xffE0DFDE),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                "12H",
                                style: TextStyle(
                                  color: toggle ? Colors.white : Colors.black,
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
                              color: toggle ? Color(0xffE0DFDE) : Colors.black,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                "24H",
                                style: TextStyle(
                                  color: toggle ? Colors.black : Colors.white,
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
        ),
      ),
    );
  }
}
