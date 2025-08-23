import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CrystalNavigationBar(
      currentIndex: 0,
      onTap: (value) {},
      outlineBorderColor: Colors.deepPurple[400]!,
      borderWidth: 2,
      backgroundColor: Colors.deepPurple[300],
      items: [
        CrystalNavigationBarItem(
          icon: Icons.notes_outlined,
          selectedColor: Colors.white,
        ),
        CrystalNavigationBarItem(
          icon: Icons.favorite_outline_outlined,
          selectedColor: Colors.white,
        ),
      ],
    );
  }
}
