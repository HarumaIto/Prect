import 'dart:async';

import 'package:wifi_scan/wifi_scan.dart';

class ScanWifiUtil {
  bool isScanning = false;

  List<String> wifiNames = [];

  // 外部にデータを渡すよう
  final StreamController _stateStreamController = StreamController.broadcast();

  Stream get state => _stateStreamController.stream;

  StreamSubscription<List<WiFiAccessPoint>>? _subscription;

  // 初期化時に呼ぶ
  void init() async {
    // サービスと権限の確認
    final can = await WiFiScan.instance.canStartScan(askPermissions: true);
    print(can);
  }

  // WiFiをScanする
  void startScan() async {
    final can = await WiFiScan.instance.canStartScan(askPermissions: true);
    print(can);
    if (can == CanStartScan.yes && !isScanning) {
      print('scan');
      wifiNames.clear();
      _subscription?.cancel();
      isScanning = await WiFiScan.instance.startScan();
      _startListeningToScannedResults();
    }
  }

  // WiFiを見つけたら通知する
  void _startListeningToScannedResults() async {
    final can = await WiFiScan.instance.canStartScan(askPermissions: true);
    if (can == CanStartScan.yes) {
      _subscription = WiFiScan.instance.onScannedResultsAvailable.listen((results) {
        print(results);
        for (var result in results) {
          final knownWifi = wifiNames.indexWhere((w) => w == result.venueName);
          if (knownWifi >= 0) {
            wifiNames[knownWifi] = result.venueName ?? '';
          } else {
            wifiNames.add(result.venueName ?? 'no name');
          }
        }
      });
      _pushState();
    }
  }

  // streamを更新する
  void _pushState() {
    _stateStreamController.add(
      wifiNames
    );
  }

  void dispose() async {
    await _stateStreamController.close();
    await _subscription?.cancel();
  }
}