import 'package:get/get.dart';

class NavigationController extends GetxController {
  final RxInt _selectedMenuOption = 0.obs;

  int get selectedMenuOption => _selectedMenuOption.value;

  set selectedMenuOption(int i) {
    _selectedMenuOption.value = i;
  }

  @override
  void onInit() {
    super.onInit();
    print('1. onInit from NavigationController');
  }

  // @override
  // bool get initialized => throw UnimplementedError();

  //  @override
  // void $configureLifeCycle() {
  // }

  // @override
  // Disposer addListener(GetStateUpdate listener) {
  //   throw UnimplementedError();
  // }

  // @override
  // Disposer addListenerId(Object? key, GetStateUpdate listener) {
  //   throw UnimplementedError();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  // @override
  // void disposeId(Object id) {
  // }

  // @override
  // bool get hasListeners => throw UnimplementedError();

  // @override
  // bool get initialized => throw UnimplementedError();

  // @override
  // bool get isClosed => throw UnimplementedError();

  // @override
  // int get listeners => throw UnimplementedError();

  // @override
  // void notifyChildrens() {
  // }

  // @override
  // void onClose() {
  // }

  // @override
  // InternalFinalCallback<void> get onDelete => throw UnimplementedError();

  // @override
  // void onReady() {
  // }

  // @override
  // InternalFinalCallback<void> get onStart => throw UnimplementedError();

  // @override
  // void refresh() {
  // }

  // @override
  // void refreshGroup(Object id) {
  // }

  // @override
  // void removeListener(VoidCallback listener) {
  // }

  // @override
  // void removeListenerId(Object id, VoidCallback listener) {
  // }

  // @override
  // void update([List<Object>? ids, bool condition = true]) {
  // }
}
