import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';

class CustomListView extends StatelessWidget {
  final IconData icon;

  const CustomListView({
    Key? key,
    required this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: ( _, i ) => ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(scans[i].value),
        subtitle: Text('${scans[i].id}'),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
        onTap: () {},
      )
    );
  }
}