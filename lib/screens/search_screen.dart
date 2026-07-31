import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // 1. This prevents the keyboard from crushing your 50/50 layout!
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            // --- TOP HALF (BLACK AREA) ---
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.topRight,
                    radius: 1.5,
                    colors: [Color(0xFF2A2A2A), Colors.black],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: -40,
                      right: -50,
                      child: Icon(
                        Icons.public,
                        size: 320,
                        color: Colors.white.withOpacity(0.03),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 30,
                          right: 30,
                          bottom: 40,
                        ),
                        child: Text(
                          "Where to\nnext?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            height: 1.1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // --- BOTTOM HALF (WHITE SEARCH AREA) ---
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                // 2. We wrap the inner column in a SingleChildScrollView
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- THE SEARCH FIELD ---
                      TextField(
                        cursorColor: Colors.black,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          hintText: "Search city (e.g., London, Tokyo)...",
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 28,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // --- POPULAR CITIES SECTION ---
                      Text(
                        "POPULAR",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade500,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          _buildCityChip("Islamabad"),
                          _buildCityChip("London"),
                          _buildCityChip("New York"),
                          _buildCityChip("Dubai"),
                          _buildCityChip("Karachi"),
                        ],
                      ),

                      const SizedBox(height: 40),

                      // --- RECENT SEARCHES SECTION ---
                      Text(
                        "RECENT",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade500,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // 3. We use shrinkWrap and NeverScrollableScrollPhysics
                      // so the ListView sizes itself properly inside the SingleChildScrollView
                      ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        children: [
                          _buildRecentSearchTile("Toronto", "Canada"),
                          _buildRecentSearchTile("Tokyo", "Japan"),
                          _buildRecentSearchTile("Sydney", "Australia"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCityChip(String cityName) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        cityName,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildRecentSearchTile(String city, String country) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.history, color: Colors.grey),
      title: Text(
        city,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      subtitle: Text(country, style: TextStyle(color: Colors.grey.shade500)),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 14,
        color: Colors.grey,
      ),
      onTap: () {},
    );
  }
}
