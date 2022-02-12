import 'package:get/get.dart';
import 'package:qr_scanner/providers/navigation_controller.dart';
import 'package:qr_scanner/providers/scan_list_controller.dart';

class BasicBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationController());
    Get.lazyPut(() => ScanListController());
  }
}
