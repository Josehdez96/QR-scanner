import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/navigation_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return BottomNavigationBar(
      onTap: (index) {
        navigationProvider.selectedMenuOption = index;
      },
      currentIndex: navigationProvider.selectedMenuOption,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Map'),
        BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration_rounded), label: 'Directions'),
      ],
    );
  }
}
