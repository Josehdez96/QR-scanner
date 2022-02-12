import 'package:get/get.dart';
import 'package:qr_scanner/controllers/navigation_controller.dart';
import 'package:qr_scanner/controllers/scan_list_controller.dart';

class BasicBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationController());
    Get.lazyPut(() => ScanListController());
  }
}
