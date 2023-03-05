import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prect/util/permission_util.dart';

import 'app.dart';
import 'firebase_options.dart';

void main() async {
  // main関数でasync/awaitを使えるようにする
  WidgetsFlutterBinding.ensureInitialized();

  // Firebaseの初期化
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 権限
  PermissionUtil.locationRequest();

  // RiverPodの範囲を設定
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}