import 'package:get/get.dart';
import 'package:qr_scanner/providers/db_provider.dart';

class ScanListController extends GetxController {
  RxList<ScanModel> scans = <ScanModel>[].obs;
  RxString selectedType = 'http'.obs;

  Future<ScanModel> newScan(String value) async {
    final newScan = ScanModel(value: value);
    final id = await DBProvider.db.newScan(newScan);
    newScan.id = id;

    if (selectedType.value == newScan.type) {
      scans.add(newScan);
    }
    return newScan;
  }

  void loadScans() async {
    final allScans = await DBProvider.db.getAllScans();
    scans.value = [...allScans];
  }

  void loadScansByType(String type) async {
    final allScans = await DBProvider.db.getScansByType(type);
    scans.value = [...allScans];
    selectedType.value = type;
  }

  void deleteScanById(int id) async {
    await DBProvider.db.deleteScan(id);
  }

  void deleteAllScans() async {
    await DBProvider.db.deleteAllScans();
    scans.value = [];
  }
}
