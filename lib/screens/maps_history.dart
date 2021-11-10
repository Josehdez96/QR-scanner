import 'package:flutter/material.dart';
import 'package:qr_scanner/widgets/scan_tiles.dart';

class MapsHistoryScreen extends StatelessWidget {
  const MapsHistoryScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {    
    return const ScanTiles(icon: Icons.map_rounded);
  }
}