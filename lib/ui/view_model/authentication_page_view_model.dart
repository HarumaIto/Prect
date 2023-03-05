import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prect/model/ui_state/authentication_page_state.dart';

import '../view/main_page.dart';

class AuthenticationPageViewModel {
  // アカウント作成
  void onCreateAccount(AuthenticationPageState state, BuildContext context) async {
    // メールパスワードでサインイン
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.createUserWithEmailAndPassword(
      email: state.email,
      password: state.password,
    );

    _transitionMainPage(context);
  }
  // サインイン
  void onSignIn(AuthenticationPageState state, BuildContext context) async {
    // メールパスワードでログイン
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signInWithEmailAndPassword(
      email: state.email,
      password: state.password,
    );
    _transitionMainPage(context);
  }

  void _transitionMainPage(BuildContext context) {
    // 画面遷移 + ログイン画面を廃棄
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) {
        return MainPage();
      })
    );
  }
}