import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner/controllers/navigation_controller.dart';

class CustomNavigationBar extends GetView<NavigationController> {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BottomNavigationBar(
        onTap: (index) {
          controller.selectedMenuOption = index;
        },
        currentIndex: controller.selectedMenuOption,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration_rounded),
            label: 'Directions',
          ),
        ],
      );
    });
  }
}
