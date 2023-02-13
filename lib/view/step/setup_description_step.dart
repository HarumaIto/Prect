import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:prect/model/widget_info.dart';

import '../widget/number_list.dart';

class SetupDescriptionStep extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // 初期化時に実行
    if (WidgetInfo.stepWidth == 0.0) {
      WidgetInfo.stepWidth = MediaQuery.of(context).size.width/1.5;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'デバイスの準備',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        NumberList(
          texts: const [
            'デバイスの電源をONにしてください',
            'デバイスのボタンを押して設定モードに変更してください',
          ],
          pereWidth: WidgetInfo.stepWidth,
        ),
      ],
    );
  }
}