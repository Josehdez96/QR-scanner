import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {
        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //   '#3D8BEF', 
        //   'Cancel', 
        //   false, 
        //   ScanMode.QR
        // );
        final barcodeScanRes = 'https://www.linkedin.com/in/jose-daniel-hernandez';
        
        print(barcodeScanRes);
      }
    );
  }
}