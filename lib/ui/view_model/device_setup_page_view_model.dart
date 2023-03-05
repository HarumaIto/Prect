import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view/device_setup_page.dart';

class DeviceSetupPageViewModel {
  static const MethodChannel channel = const MethodChannel("com.iruma.prect/native");

  WidgetRef? _ref = null;

  set widgetRef(WidgetRef ref) {
    _ref ??= ref;
  }

  void setMethodCallHandler() {
    channel.setMethodCallHandler(_platformCallHandler);
  }

  Future<dynamic> _platformCallHandler(MethodCall call) async {
    switch (call.method) {
      case 'configureAccessPointResult':
        print('Configure access point result: ${call.arguments}');
        _ref!.watch(deviceSetupPageProvider.notifier).connectivity = call.arguments;
        break;
      default:
        print('Unknowm method ${call.method}');
        throw MissingPluginException();
    }
  }

  void configureAccessPoint() {
    // ネイティブでアクセスポイントに接続させる
    channel.invokeListMethod('configureAccessPoint',);
  }

  bool isStepEqual(int index) {
    return _ref!.read(deviceSetupPageProvider).stepperIndex == index;
  }

  void sendRegisterData(InAppWebViewController controller) {
    // 'string' <- もともとの文字列だとJavaScript側でエラーが起きる
    final pageState = _ref!.read(deviceSetupPageProvider);
    final args = [
      '\'${pageState.wifiSsid}\'',
      '\'${pageState.wifiPassword}\'',
      '\'${pageState.accountEmail}\'',
      '\'${pageState.accountPassword}\''
    ];
    controller.evaluateJavascript(source: 'receiveRegisterData($args);');
  }

  void setRegisteredData(List<dynamic> args) {
    print(args.toString());
    _ref!.watch(deviceSetupPageProvider.notifier).setRegisteredData(args[0], args[1], args[2], args[3]);
  }
}