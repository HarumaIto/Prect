// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_setup_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeviceSetupPageState {
  int get stepperIndex => throw _privateConstructorUsedError;
  int get connectivity => throw _privateConstructorUsedError;
  String get wifiSsid => throw _privateConstructorUsedError;
  String get wifiPassword => throw _privateConstructorUsedError;
  String get accountEmail => throw _privateConstructorUsedError;
  String get accountPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviceSetupPageStateCopyWith<DeviceSetupPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceSetupPageStateCopyWith<$Res> {
  factory $DeviceSetupPageStateCopyWith(DeviceSetupPageState value,
          $Res Function(DeviceSetupPageState) then) =
      _$DeviceSetupPageStateCopyWithImpl<$Res, DeviceSetupPageState>;
  @useResult
  $Res call(
      {int stepperIndex,
      int connectivity,
      String wifiSsid,
      String wifiPassword,
      String accountEmail,
      String accountPassword});
}

/// @nodoc
class _$DeviceSetupPageStateCopyWithImpl<$Res,
        $Val extends DeviceSetupPageState>
    implements $DeviceSetupPageStateCopyWith<$Res> {
  _$DeviceSetupPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepperIndex = null,
    Object? connectivity = null,
    Object? wifiSsid = null,
    Object? wifiPassword = null,
    Object? accountEmail = null,
    Object? accountPassword = null,
  }) {
    return _then(_value.copyWith(
      stepperIndex: null == stepperIndex
          ? _value.stepperIndex
          : stepperIndex // ignore: cast_nullable_to_non_nullable
              as int,
      connectivity: null == connectivity
          ? _value.connectivity
          : connectivity // ignore: cast_nullable_to_non_nullable
              as int,
      wifiSsid: null == wifiSsid
          ? _value.wifiSsid
          : wifiSsid // ignore: cast_nullable_to_non_nullable
              as String,
      wifiPassword: null == wifiPassword
          ? _value.wifiPassword
          : wifiPassword // ignore: cast_nullable_to_non_nullable
              as String,
      accountEmail: null == accountEmail
          ? _value.accountEmail
          : accountEmail // ignore: cast_nullable_to_non_nullable
              as String,
      accountPassword: null == accountPassword
          ? _value.accountPassword
          : accountPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeviceSetupPageStateCopyWith<$Res>
    implements $DeviceSetupPageStateCopyWith<$Res> {
  factory _$$_DeviceSetupPageStateCopyWith(_$_DeviceSetupPageState value,
          $Res Function(_$_DeviceSetupPageState) then) =
      __$$_DeviceSetupPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int stepperIndex,
      int connectivity,
      String wifiSsid,
      String wifiPassword,
      String accountEmail,
      String accountPassword});
}

/// @nodoc
class __$$_DeviceSetupPageStateCopyWithImpl<$Res>
    extends _$DeviceSetupPageStateCopyWithImpl<$Res, _$_DeviceSetupPageState>
    implements _$$_DeviceSetupPageStateCopyWith<$Res> {
  __$$_DeviceSetupPageStateCopyWithImpl(_$_DeviceSetupPageState _value,
      $Res Function(_$_DeviceSetupPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepperIndex = null,
    Object? connectivity = null,
    Object? wifiSsid = null,
    Object? wifiPassword = null,
    Object? accountEmail = null,
    Object? accountPassword = null,
  }) {
    return _then(_$_DeviceSetupPageState(
      stepperIndex: null == stepperIndex
          ? _value.stepperIndex
          : stepperIndex // ignore: cast_nullable_to_non_nullable
              as int,
      connectivity: null == connectivity
          ? _value.connectivity
          : connectivity // ignore: cast_nullable_to_non_nullable
              as int,
      wifiSsid: null == wifiSsid
          ? _value.wifiSsid
          : wifiSsid // ignore: cast_nullable_to_non_nullable
              as String,
      wifiPassword: null == wifiPassword
          ? _value.wifiPassword
          : wifiPassword // ignore: cast_nullable_to_non_nullable
              as String,
      accountEmail: null == accountEmail
          ? _value.accountEmail
          : accountEmail // ignore: cast_nullable_to_non_nullable
              as String,
      accountPassword: null == accountPassword
          ? _value.accountPassword
          : accountPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeviceSetupPageState implements _DeviceSetupPageState {
  _$_DeviceSetupPageState(
      {this.stepperIndex = 0,
      this.connectivity = 0,
      this.wifiSsid = '',
      this.wifiPassword = '',
      this.accountEmail = '',
      this.accountPassword = ''});

  @override
  @JsonKey()
  final int stepperIndex;
  @override
  @JsonKey()
  final int connectivity;
  @override
  @JsonKey()
  final String wifiSsid;
  @override
  @JsonKey()
  final String wifiPassword;
  @override
  @JsonKey()
  final String accountEmail;
  @override
  @JsonKey()
  final String accountPassword;

  @override
  String toString() {
    return 'DeviceSetupPageState(stepperIndex: $stepperIndex, connectivity: $connectivity, wifiSsid: $wifiSsid, wifiPassword: $wifiPassword, accountEmail: $accountEmail, accountPassword: $accountPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviceSetupPageState &&
            (identical(other.stepperIndex, stepperIndex) ||
                other.stepperIndex == stepperIndex) &&
            (identical(other.connectivity, connectivity) ||
                other.connectivity == connectivity) &&
            (identical(other.wifiSsid, wifiSsid) ||
                other.wifiSsid == wifiSsid) &&
            (identical(other.wifiPassword, wifiPassword) ||
                other.wifiPassword == wifiPassword) &&
            (identical(other.accountEmail, accountEmail) ||
                other.accountEmail == accountEmail) &&
            (identical(other.accountPassword, accountPassword) ||
                other.accountPassword == accountPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stepperIndex, connectivity,
      wifiSsid, wifiPassword, accountEmail, accountPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeviceSetupPageStateCopyWith<_$_DeviceSetupPageState> get copyWith =>
      __$$_DeviceSetupPageStateCopyWithImpl<_$_DeviceSetupPageState>(
          this, _$identity);
}

abstract class _DeviceSetupPageState implements DeviceSetupPageState {
  factory _DeviceSetupPageState(
      {final int stepperIndex,
      final int connectivity,
      final String wifiSsid,
      final String wifiPassword,
      final String accountEmail,
      final String accountPassword}) = _$_DeviceSetupPageState;

  @override
  int get stepperIndex;
  @override
  int get connectivity;
  @override
  String get wifiSsid;
  @override
  String get wifiPassword;
  @override
  String get accountEmail;
  @override
  String get accountPassword;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceSetupPageStateCopyWith<_$_DeviceSetupPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
