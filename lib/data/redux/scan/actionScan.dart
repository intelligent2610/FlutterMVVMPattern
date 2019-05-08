import 'package:share_your_christmas/model/scan/scanModel.dart';

class ScanAction {
  final String scanResult;

  ScanAction(this.scanResult);
}

class ResponseScanFromServer {
  final ScanRs scanRs;

  ResponseScanFromServer(this.scanRs);
}

