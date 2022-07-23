import 'package:get/get.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(ScanModel scan) async {
  final url = Uri.parse(scan.value);
  if (scan.type == 'http') {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  } else {
    Get.toNamed('/map', arguments: scan);
  }
}
