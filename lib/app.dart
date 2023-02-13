import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prect/view/authenication_page.dart';

import 'view/main_page.dart';

class MyApp extends ConsumerWidget {
  // RiverPodに登録するようにコンストラクタで取得
  MyApp({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //  アプリ全体のUIを実装
    return MaterialApp(
      title: 'prect',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox();
          }
          if (snapshot.hasData) {
            return MainPage();
          }
          return AuthenticationPage();
        },
      )
    );
  }
}