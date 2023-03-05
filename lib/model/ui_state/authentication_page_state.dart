import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_page_state.freezed.dart';

@freezed
class AuthenticationPageState with _$AuthenticationPageState {
  factory AuthenticationPageState({
    @Default('') String email,
    @Default('') String password,
  }) = _AuthenticationPageState;
}

class AuthenticationPageNotifier extends StateNotifier<AuthenticationPageState> {
  AuthenticationPageNotifier() : super(AuthenticationPageState());

  set email(String email) {
    state = state.copyWith(email: email);
  }

  set password(String password) {
    state = state.copyWith(password: password);
  }
}