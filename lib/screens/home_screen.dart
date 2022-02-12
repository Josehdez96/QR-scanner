import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner/providers/scan_list_controller.dart';
import 'package:qr_scanner/providers/navigation_controller.dart';
import 'package:qr_scanner/screens/maps_history.dart';
import 'package:qr_scanner/widgets/custom_navigaton_bar.dart';
import 'package:qr_scanner/widgets/scan_button.dart';

import 'directions_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListController = Get.put(ScanListController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('History'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                scanListController.deleteAllScans();
              },
              icon: const Icon(Icons.delete_sharp))
        ],
      ),
      body: const _HomeScreenBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListController = Get.find<ScanListController>();
    final navigationController = Get.put(NavigationController());

    return Obx(() {
      print(
          'HOLA SOY EL CURRENTINDEX: ${navigationController.selectedMenuOption}');
      switch (navigationController.selectedMenuOption) {
        case 0:
          scanListController.loadScansByType('geo');
          return const MapsHistoryScreen();
        case 1:
          scanListController.loadScansByType('http');
          return const DirectionsScreen();
        default:
          return const MapsHistoryScreen();
      }
    });
  }
}
