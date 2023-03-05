import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_model/device_setup_page_view_model.dart';
import '../device_setup_page.dart';

class WifiAccessStep extends ConsumerWidget {
  final DeviceSetupPageViewModel viewModel;

  WifiAccessStep(this.viewModel) {
    viewModel.setMethodCallHandler();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.read(deviceSetupPageProvider);
    return SizedBox(
      width: double.infinity,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(pageState.connectivity==1 ? '接続済み' : '未接続'), // 0が初期値、-1が切断時
          ElevatedButton(
            onPressed: () => viewModel.configureAccessPoint(),
            child: Text('接続する'),
          )
        ],
      ),
    );
  }
}