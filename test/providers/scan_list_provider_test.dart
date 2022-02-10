import 'package:mockito/mockito.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';

class ScanListProviderMock extends Mock implements ScanListProvider {
  @override
  List<ScanModel> scans = [];
}
