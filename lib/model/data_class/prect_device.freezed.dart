// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prect_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PrectDevice {
  int get deviceId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PrectDeviceCopyWith<PrectDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrectDeviceCopyWith<$Res> {
  factory $PrectDeviceCopyWith(
          PrectDevice value, $Res Function(PrectDevice) then) =
      _$PrectDeviceCopyWithImpl<$Res, PrectDevice>;
  @useResult
  $Res call({int deviceId, String name});
}

/// @nodoc
class _$PrectDeviceCopyWithImpl<$Res, $Val extends PrectDevice>
    implements $PrectDeviceCopyWith<$Res> {
  _$PrectDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PrectDeviceCopyWith<$Res>
    implements $PrectDeviceCopyWith<$Res> {
  factory _$$_PrectDeviceCopyWith(
          _$_PrectDevice value, $Res Function(_$_PrectDevice) then) =
      __$$_PrectDeviceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int deviceId, String name});
}

/// @nodoc
class __$$_PrectDeviceCopyWithImpl<$Res>
    extends _$PrectDeviceCopyWithImpl<$Res, _$_PrectDevice>
    implements _$$_PrectDeviceCopyWith<$Res> {
  __$$_PrectDeviceCopyWithImpl(
      _$_PrectDevice _value, $Res Function(_$_PrectDevice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? name = null,
  }) {
    return _then(_$_PrectDevice(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PrectDevice implements _PrectDevice {
  _$_PrectDevice({this.deviceId = 0, this.name = ''});

  @override
  @JsonKey()
  final int deviceId;
  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'PrectDevice(deviceId: $deviceId, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PrectDevice &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PrectDeviceCopyWith<_$_PrectDevice> get copyWith =>
      __$$_PrectDeviceCopyWithImpl<_$_PrectDevice>(this, _$identity);
}

abstract class _PrectDevice implements PrectDevice {
  factory _PrectDevice({final int deviceId, final String name}) =
      _$_PrectDevice;

  @override
  int get deviceId;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_PrectDeviceCopyWith<_$_PrectDevice> get copyWith =>
      throw _privateConstructorUsedError;
}
