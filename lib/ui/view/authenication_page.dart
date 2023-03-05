import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prect/model/ui_state/authentication_page_state.dart';

import '../view_model/authentication_page_view_model.dart';

final authenticationPageProvider = StateNotifierProvider<AuthenticationPageNotifier, AuthenticationPageState>((_) {
  return AuthenticationPageNotifier();
});

class AuthenticationPage extends ConsumerWidget {
  AuthenticationPage({super.key});

  AuthenticationPageViewModel viewModel = AuthenticationPageViewModel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageNotifier = ref.read(authenticationPageProvider.notifier);
    final pageState = ref.watch(authenticationPageProvider);

    return Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'メールアドレス'),
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          pageNotifier.email = value;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'パスワード'),
                        obscureText: true,
                        onChanged: (value) {
                          pageNotifier.password = value;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => viewModel.onCreateAccount(pageState, context),
                    child: const Text('アカウント作成'),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => viewModel.onSignIn(pageState, context),
                    child: const Text('サインイン'),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}