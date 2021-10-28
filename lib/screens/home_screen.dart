import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';
import 'package:qr_scanner/screens/directions_screen.dart';
import 'package:qr_scanner/screens/map_screen.dart';
import 'package:qr_scanner/widgets/custom_navigaton_bar.dart';
import 'package:qr_scanner/widgets/scan_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('History'),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete_sharp))
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
  const _HomeScreenBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final currentIndex = Provider.of<UiProvider>(context).selectedMenuOption;

    DBProvider.db.database;

    switch (currentIndex) {
      case 0:
        return const MapScreen();
      case 1:
        return const DirectionsScreen();
      default:
      return const MapScreen();
    }
  }
}