import 'dart:convert';

import 'package:http/http.dart' as http;

class WorldTime {
  String locationName;
  String time = "Loading..";
  String url;
  String image;
  bool isDaytime = true;

  // 1. Add this to hold the raw live DateTime object
  DateTime? currentDateTime;

  WorldTime({
    required this.image,
    required this.locationName,
    required this.url,
  });

  Future<void> getTime() async {
    try {
      final response = await http.get(
        Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=$url'),
      );

      Map data = jsonDecode(response.body);

      // 2. Store the raw DateTime object
      currentDateTime = DateTime.parse(data['dateTime']);

      // 3. Format the display string
      updateFormattedTime();
    } catch (e) {
      print(e);
      time = "Failed to load time";
    }
  }

  // 4. Create a helper method to increment the time by 1 second & format it
  void tick() {
    if (currentDateTime != null) {
      currentDateTime = currentDateTime!.add(const Duration(seconds: 1));
      updateFormattedTime();
    }
  }

  // 5. Helper function to turn currentDateTime into the formatted String
  void updateFormattedTime() {
    if (currentDateTime == null) return;

    DateTime now = currentDateTime!;
    String period = now.hour >= 12 ? 'PM' : 'AM';
    int hour = now.hour > 12 ? now.hour - 12 : now.hour;
    if (hour == 0) hour = 12;

    String minute = now.minute < 10 ? '0${now.minute}' : '${now.minute}';

    // Added seconds so you can see it tick live!
    time = '$hour:$minute $period';
  }
}
