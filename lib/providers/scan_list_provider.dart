import 'package:flutter/material.dart';
import 'package:qr_scanner/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {

  List<ScanModel> scans = [];
  String selectedType = 'http';

  Future<ScanModel> newScan( String value ) async {
    final newScan = ScanModel(value: value);
    final id = await DBProvider.db.newScan(newScan);
    newScan.id = id;

    if (selectedType == newScan.type) {
      scans.add(newScan);
      notifyListeners();
    }
    return newScan;
  }
  
  void loadScans() async {
    final allScans = await DBProvider.db.getAllScans();
    scans = [...allScans];
    notifyListeners();
  }

  void loadScansByType(String type) async {
    final allScans = await DBProvider.db.getScansByType(type);
    scans = [...allScans];
    selectedType = type;
    notifyListeners();
  }

  void deleteScanById(int id) async {
    await DBProvider.db.deleteScan(id);
  }

  void deleteAllScans() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }
}