import 'package:flutter/material.dart';
import 'package:qr_scanner/providers/db_provider.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scan = ModalRoute.of(context)?.settings.arguments as ScanModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: Center(
        child: Text(scan.value)
      ),
    );
  }
}