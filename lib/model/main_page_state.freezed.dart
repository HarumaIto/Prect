// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainPageState {
  List<Map<double, dynamic>> get lineBarData =>
      throw _privateConstructorUsedError;
  List<PrectDevice> get registeredDevices => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainPageStateCopyWith<MainPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainPageStateCopyWith<$Res> {
  factory $MainPageStateCopyWith(
          MainPageState value, $Res Function(MainPageState) then) =
      _$MainPageStateCopyWithImpl<$Res, MainPageState>;
  @useResult
  $Res call(
      {List<Map<double, dynamic>> lineBarData,
      List<PrectDevice> registeredDevices});
}

/// @nodoc
class _$MainPageStateCopyWithImpl<$Res, $Val extends MainPageState>
    implements $MainPageStateCopyWith<$Res> {
  _$MainPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lineBarData = null,
    Object? registeredDevices = null,
  }) {
    return _then(_value.copyWith(
      lineBarData: null == lineBarData
          ? _value.lineBarData
          : lineBarData // ignore: cast_nullable_to_non_nullable
              as List<Map<double, dynamic>>,
      registeredDevices: null == registeredDevices
          ? _value.registeredDevices
          : registeredDevices // ignore: cast_nullable_to_non_nullable
              as List<PrectDevice>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MainPatgeStateCopyWith<$Res>
    implements $MainPageStateCopyWith<$Res> {
  factory _$$_MainPatgeStateCopyWith(
          _$_MainPatgeState value, $Res Function(_$_MainPatgeState) then) =
      __$$_MainPatgeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Map<double, dynamic>> lineBarData,
      List<PrectDevice> registeredDevices});
}

/// @nodoc
class __$$_MainPatgeStateCopyWithImpl<$Res>
    extends _$MainPageStateCopyWithImpl<$Res, _$_MainPatgeState>
    implements _$$_MainPatgeStateCopyWith<$Res> {
  __$$_MainPatgeStateCopyWithImpl(
      _$_MainPatgeState _value, $Res Function(_$_MainPatgeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lineBarData = null,
    Object? registeredDevices = null,
  }) {
    return _then(_$_MainPatgeState(
      lineBarData: null == lineBarData
          ? _value._lineBarData
          : lineBarData // ignore: cast_nullable_to_non_nullable
              as List<Map<double, dynamic>>,
      registeredDevices: null == registeredDevices
          ? _value._registeredDevices
          : registeredDevices // ignore: cast_nullable_to_non_nullable
              as List<PrectDevice>,
    ));
  }
}

/// @nodoc

class _$_MainPatgeState implements _MainPatgeState {
  _$_MainPatgeState(
      {required final List<Map<double, dynamic>> lineBarData,
      final List<PrectDevice> registeredDevices = const []})
      : _lineBarData = lineBarData,
        _registeredDevices = registeredDevices;

  final List<Map<double, dynamic>> _lineBarData;
  @override
  List<Map<double, dynamic>> get lineBarData {
    if (_lineBarData is EqualUnmodifiableListView) return _lineBarData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lineBarData);
  }

  final List<PrectDevice> _registeredDevices;
  @override
  @JsonKey()
  List<PrectDevice> get registeredDevices {
    if (_registeredDevices is EqualUnmodifiableListView)
      return _registeredDevices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_registeredDevices);
  }

  @override
  String toString() {
    return 'MainPageState(lineBarData: $lineBarData, registeredDevices: $registeredDevices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainPatgeState &&
            const DeepCollectionEquality()
                .equals(other._lineBarData, _lineBarData) &&
            const DeepCollectionEquality()
                .equals(other._registeredDevices, _registeredDevices));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_lineBarData),
      const DeepCollectionEquality().hash(_registeredDevices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainPatgeStateCopyWith<_$_MainPatgeState> get copyWith =>
      __$$_MainPatgeStateCopyWithImpl<_$_MainPatgeState>(this, _$identity);
}

abstract class _MainPatgeState implements MainPageState {
  factory _MainPatgeState(
      {required final List<Map<double, dynamic>> lineBarData,
      final List<PrectDevice> registeredDevices}) = _$_MainPatgeState;

  @override
  List<Map<double, dynamic>> get lineBarData;
  @override
  List<PrectDevice> get registeredDevices;
  @override
  @JsonKey(ignore: true)
  _$$_MainPatgeStateCopyWith<_$_MainPatgeState> get copyWith =>
      throw _privateConstructorUsedError;
}
