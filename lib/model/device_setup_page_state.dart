import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_setup_page_state.freezed.dart';

@freezed
class DeviceSetupPageState with _$DeviceSetupPageState {
  factory DeviceSetupPageState({
    @Default(0) int stepperIndex,
    @Default(0) int connectivity,
    @Default('') String wifiSsid,
    @Default('') String wifiPassword,
    @Default('') String accountEmail,
    @Default('') String accountPassword,
  }) = _DeviceSetupPageState;
}

class DeviceSetupPageNotifier extends StateNotifier<DeviceSetupPageState> {
  DeviceSetupPageNotifier() : super(DeviceSetupPageState());

  set stepperIndex(int index) {
    state = state.copyWith(stepperIndex: index);
  }

  set connectivity(int status) {
    state = state.copyWith(connectivity: status);
  }

  void setRegisteredData(
      String wifiSsid,
      String wifiPassword,
      String accountEmail,
      String accountPassword) {
    state = state.copyWith(
      wifiSsid: wifiSsid,
      wifiPassword: wifiPassword,
      accountEmail: accountEmail,
      accountPassword: accountPassword
    );
  }

  void reset() {
    state = state.copyWith(
      stepperIndex: 0,
    );
  }
}