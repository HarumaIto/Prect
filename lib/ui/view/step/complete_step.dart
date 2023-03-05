import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompleteStep extends ConsumerStatefulWidget {
  const CompleteStep({Key? key}) : super(key: key);

  @override
  CompleteStepState createState() => CompleteStepState();
}

class CompleteStepState extends ConsumerState<CompleteStep> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'デバイスのセットアップが完了しました',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}