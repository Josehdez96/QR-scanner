import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/utils/utils.dart';
import 'package:qr_scanner/widgets/circular_button.dart';

class ScanButton extends StatefulWidget {
  const ScanButton({ Key? key }) : super(key: key);

  @override
  State<ScanButton> createState() => _ScanButtonState();
}

class _ScanButtonState extends State<ScanButton> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation degOneTranslationAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 150));
    degOneTranslationAnimation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    animationController.addListener(() {
      setState(() { });
    });
  }

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          IgnorePointer(
            child: Container(
              width: 150,
              height: 150,
              color: Colors.transparent,
            ),
          ),
    
          Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegree(225), degOneTranslationAnimation.value * 80),
            child: CircularButton(
              width: 54,
              height: 54, 
              color: Colors.deepPurple,
              icon: const Icon(Icons.camera_alt_rounded), 
              onPressed: () async {
                String scannedData = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancel', false, ScanMode.QR);
        
                if (scannedData == '-1') {
                  // scanned was cancel
                  return;
                }
                final newScan = await scanListProvider.newScan(scannedData);
                launchURL(context, newScan);
              }
            )
          ),
    
          Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegree(315), degOneTranslationAnimation.value * 80),
            child: CircularButton(
              width: 54,
              height: 54, 
              color: Colors.deepPurple,
              icon: const Icon(Icons.insert_photo), 
              onPressed: () => print('Buenas 2')
            )
          ),
    
          FloatingActionButton(
            child: const Icon(Icons.filter_center_focus),
            onPressed: () {
              if (animationController.isCompleted) {
                animationController.reverse();
              } else {
                animationController.forward();
              }
            }
          ),
        ] 
      ),
    );
  }
}