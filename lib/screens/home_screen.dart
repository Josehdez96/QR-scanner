import 'package:flutter/material.dart';
import 'package:qr_scanner/widgets/custom_navigaton_bar.dart';
import 'package:qr_scanner/widgets/scan_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('History'),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete_sharp))
        ],
      ),
      body: const Center(
        child: Text('Home screen')
      ),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}