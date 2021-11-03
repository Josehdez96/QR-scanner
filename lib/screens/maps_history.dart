import 'package:flutter/material.dart';
import 'package:qr_scanner/widgets/custom_list_view.dart';

class MapsHistoryScreen extends StatelessWidget {
  const MapsHistoryScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {    
    return const CustomListView(icon: Icons.map_rounded);
  }
}