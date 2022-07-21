import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/providers/navigation_provider.dart';
import 'package:qr_scanner/screens/maps_history.dart';
import 'package:qr_scanner/widgets/custom_navigaton_bar.dart';
import 'package:qr_scanner/widgets/scan_button.dart';

import 'directions_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('History'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ScanListProvider>(context, listen: false)
                  .deleteAllScans();
            },
            icon: const Icon(Icons.delete_sharp),
          )
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
    final currentIndex =
        Provider.of<NavigationProvider>(context).selectedMenuOption;
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    // print(currentIndex); // Just to check TODO: delete it
    switch (currentIndex) {
      case 0:
        scanListProvider.loadScansByType('geo');
        return const MapsHistoryScreen();
      case 1:
        scanListProvider.loadScansByType('http');
        return const DirectionsScreen();
      default:
        return const MapsHistoryScreen();
    }
  }
}
