import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '08',
              style: TextStyle(fontSize: 118, fontWeight: FontWeight.bold),
            ),
            Text(
              '40',
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
              'Thu',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
              '30 July',
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
                  '15',
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
