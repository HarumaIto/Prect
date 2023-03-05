import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prect/model/ui_state/device_setup_page_state.dart';

import '../../view_model/device_setup_page_view_model.dart';
import '../device_setup_page.dart';

class WriteInformationStep extends ConsumerWidget {
  static const WEB_PAGE_URI = 'http://192.168.0.20/';

  WriteInformationStep(this.viewModel);

  final DeviceSetupPageViewModel viewModel;

  DeviceSetupPageNotifier? pageNotifier;
  DeviceSetupPageState? pageState;

  static InAppWebViewController? _webViewController;
  bool isError = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    pageNotifier = ref.watch(deviceSetupPageProvider.notifier);
    pageState = ref.read(deviceSetupPageProvider);

    final wifiSsidKey = GlobalKey<FormFieldState>();
    final wifiPasswordKey = GlobalKey<FormFieldState>();
    final accountEmailKey = GlobalKey<FormFieldState>();
    final accountPasswordKey = GlobalKey<FormFieldState>();

    final wifiPasswordFocus = FocusNode();
    final accountEmailFocus = FocusNode();
    final accountPasswordFocus = FocusNode();

    return Stack(
      children: [
        SizedBox(
          height: 200, // htmlのbodyには何もないためStackとContainerのColorで隠す
          child: InAppWebView(
            //initialFile: 'assets/index.html',
            initialUrlRequest: URLRequest(url: Uri.parse(WEB_PAGE_URI)),
            onWebViewCreated: (controller) {
              _webViewController = controller;
            },
            onLoadStop: (controller, url) {
              controller.addJavaScriptHandler(
                handlerName: 'setRegisteredData',
                callback: viewModel.setRegisteredData,
              );
              // 完全にロードが終わったときに呼び出す
              if (!isError) {
                controller.evaluateJavascript(source: 'sendSpiffsData();');
              }
            },
            onLoadError: (controller, url, code, message) {
              isError = true;
              print('error message: $message');
            },
            onConsoleMessage: (controller, consoleMessage) {
              print(consoleMessage);
            },
          ),
        ),
        Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: pageState!.wifiSsid,
                      key: wifiSsidKey,
                      decoration: const InputDecoration(labelText: 'WiFi SSID'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        Navigator.of(context).focusScopeNode.requestFocus(wifiPasswordFocus);
                      },
                    ),
                    TextFormField(
                      initialValue: pageState!.wifiPassword,
                      key: wifiPasswordKey,
                      focusNode: wifiPasswordFocus,
                      decoration: const InputDecoration(labelText: 'WiFi Password'),
                      textInputAction: TextInputAction.next,
                      obscureText: true,
                      onFieldSubmitted: (value) {
                        Navigator.of(context).focusScopeNode.requestFocus(accountEmailFocus);
                      },
                    ),
                    TextFormField(
                      initialValue: pageState!.accountEmail,
                      key: accountEmailKey,
                      focusNode: accountEmailFocus,
                      decoration: const InputDecoration(labelText: 'Account Email address'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        Navigator.of(context).focusScopeNode.requestFocus(accountPasswordFocus);
                      },
                    ),
                    TextFormField(
                      initialValue: pageState!.accountPassword,
                      key: accountPasswordKey,
                      focusNode: accountPasswordFocus,
                      decoration: const InputDecoration(labelText: 'Account Password'),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  pageNotifier!.setRegisteredData(
                      wifiSsidKey.currentState!.value,
                      wifiPasswordKey.currentState!.value,
                      accountEmailKey.currentState!.value,
                      accountPasswordKey.currentState!.value
                  );
                  viewModel.sendRegisterData(_webViewController!);
                },
                child: Text('送信'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}