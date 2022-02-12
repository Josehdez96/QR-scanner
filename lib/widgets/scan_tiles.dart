import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner/controllers/scan_list_controller.dart';
import 'package:qr_scanner/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final IconData icon;

  const ScanTiles({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScanListController scanListController = Get.find();
    final scans = scanListController.scans;

    return GetX<ScanListController>(
      builder: (_) => ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, i) => Dismissible(
          key: UniqueKey(),
          background: const _DismissibleDeleteBackground(),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              // Left swipe
              scanListController.deleteScanById(scans[i].id!);
            }
          },
          child: ListTile(
            leading: Icon(icon, color: Theme.of(context).primaryColor),
            title: Text(scans[i].value),
            subtitle: Text('${scans[i].id}'),
            trailing:
                const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
            onTap: () => launchURL(context, scans[i]),
          ),
        ),
      ),
    );
  }
}

class _DismissibleDeleteBackground extends StatelessWidget {
  const _DismissibleDeleteBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(right: 15),
          child: Icon(Icons.cancel),
        ),
      ),
    );
  }
}
