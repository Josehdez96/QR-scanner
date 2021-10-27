import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    return BottomNavigationBar(
      onTap: (optionIndx) => uiProvider.selectedMenuOption = optionIndx,
      currentIndex: uiProvider.selectedMenuOption,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Map'),
        BottomNavigationBarItem(icon: Icon(Icons.compass_calibration_outlined), label: 'Directions'),
      ]
    );
  }
}