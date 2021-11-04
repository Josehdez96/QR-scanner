import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
    return FloatingActionButton(
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {
        const String scannedData = 'geo:6.208257,-75.566986';
        // const String scannedData = 'http://platzi.com';

        if (scannedData == '-1') {
          // scanned was cancel
          return;
        }
        final newScan = await scanListProvider.newScan(scannedData);
        launchURL(context, newScan);
      }
    );
  }
}