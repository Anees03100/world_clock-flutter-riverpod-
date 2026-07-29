import 'package:flutter/material.dart';
import 'package:modern_world_clock/screens/current_location.dart';
import 'package:modern_world_clock/screens/dashboard.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  // Defaults to index 2 (Globe icon / Dashboard screen) as shown in your design
  int _selectedIndex = 2;

  // Mapping screens according to your exact rules:
  // Index 0 (Search Icon) -> Coming Soon Text
  // Index 1 (Clock Icon)  -> CurrentLocation Screen
  // Index 2 (Globe Icon)  -> Dashboard Screen
  late final List<Widget> _screens = [
    const Center(
      child: Text(
        'Screen coming soon',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    ),
    const CurrentLocation(),
    const Dashboard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          decoration: const BoxDecoration(color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(index: 0, icon: Icons.search_outlined),
              _buildNavItem(index: 1, icon: Icons.access_time_outlined),
              _buildNavItem(index: 2, icon: Icons.public_outlined),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({required int index, required IconData icon}) {
    final bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 54,
        height: 54,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.black : Colors.white,
          border: isSelected
              ? null
              : Border.all(color: Colors.grey.shade300, width: 1),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Icon(
          icon,
          size: 24,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
