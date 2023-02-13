// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthenticationPageState {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthenticationPageStateCopyWith<AuthenticationPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationPageStateCopyWith<$Res> {
  factory $AuthenticationPageStateCopyWith(AuthenticationPageState value,
          $Res Function(AuthenticationPageState) then) =
      _$AuthenticationPageStateCopyWithImpl<$Res, AuthenticationPageState>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$AuthenticationPageStateCopyWithImpl<$Res,
        $Val extends AuthenticationPageState>
    implements $AuthenticationPageStateCopyWith<$Res> {
  _$AuthenticationPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthenticationPageStateCopyWith<$Res>
    implements $AuthenticationPageStateCopyWith<$Res> {
  factory _$$_AuthenticationPageStateCopyWith(_$_AuthenticationPageState value,
          $Res Function(_$_AuthenticationPageState) then) =
      __$$_AuthenticationPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$_AuthenticationPageStateCopyWithImpl<$Res>
    extends _$AuthenticationPageStateCopyWithImpl<$Res,
        _$_AuthenticationPageState>
    implements _$$_AuthenticationPageStateCopyWith<$Res> {
  __$$_AuthenticationPageStateCopyWithImpl(_$_AuthenticationPageState _value,
      $Res Function(_$_AuthenticationPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_AuthenticationPageState(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AuthenticationPageState implements _AuthenticationPageState {
  _$_AuthenticationPageState({this.email = '', this.password = ''});

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;

  @override
  String toString() {
    return 'AuthenticationPageState(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticationPageState &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthenticationPageStateCopyWith<_$_AuthenticationPageState>
      get copyWith =>
          __$$_AuthenticationPageStateCopyWithImpl<_$_AuthenticationPageState>(
              this, _$identity);
}

abstract class _AuthenticationPageState implements AuthenticationPageState {
  factory _AuthenticationPageState(
      {final String email, final String password}) = _$_AuthenticationPageState;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_AuthenticationPageStateCopyWith<_$_AuthenticationPageState>
      get copyWith => throw _privateConstructorUsedError;
}
