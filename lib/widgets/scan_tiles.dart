import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';

class ScanTiles extends StatelessWidget {
  final IconData icon;

  const ScanTiles({
    Key? key,
    required this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: ( _, i ) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            // Left swipe
            scanListProvider.deleteScanById(scans[i].id!);
          } else {
            // Right swipe
          }
        },
        child: ListTile(
          leading: Icon(icon, color: Theme.of(context).primaryColor),
          title: Text(scans[i].value),
          subtitle: Text('${scans[i].id}'),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: () {},
        ),
      )
    );
  }
}