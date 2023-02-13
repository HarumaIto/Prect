import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prect/model/data_class/prect_device.dart';

// freezedコマンド
/* flutter pub run build_runner build --delete-conflicting-outputs */

// 生成されるファイル名を指定する
part 'main_page_state.freezed.dart';

@freezed
class MainPageState with _$MainPageState {
  factory MainPageState({
    required List<Map<double, dynamic>> lineBarData,
    @Default([]) List<PrectDevice> registeredDevices,
  }) = _MainPatgeState;
}

class MainPageNotifier extends StateNotifier<MainPageState> {
  MainPageNotifier({required List<Map<double, dynamic>> lineBarData})
      : super(MainPageState(lineBarData: lineBarData));

  set lineBarData(List<Map<double, dynamic>> lineBarData) {
    state = state.copyWith(lineBarData: lineBarData);
  }

  set connectedDevices(List<PrectDevice> devices) {
    state = state.copyWith(registeredDevices: devices);
  }
}