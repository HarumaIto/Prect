import 'package:freezed_annotation/freezed_annotation.dart';

part 'prect_device.freezed.dart';

@freezed
class PrectDevice with _$PrectDevice {
  factory PrectDevice({
    @Default(0) int deviceId,
    @Default('') String name,
  }) = _PrectDevice;
}