import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
    return FloatingActionButton(
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {

        scanListProvider.newScan('https://loquesea123.com');
        scanListProvider.newScan('geo:123');
      }
    );
  }
}