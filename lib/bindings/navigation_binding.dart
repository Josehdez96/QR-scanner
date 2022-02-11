import 'package:get/get.dart';
import 'package:qr_scanner/providers/navigation_controller.dart';

class NavigationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationController());
  }
}
