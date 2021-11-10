

import 'package:flutter/material.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, ScanModel scan) async {
  final url = scan.value;
  if (scan.type == 'http') {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  } else {
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}