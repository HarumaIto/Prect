import 'package:flutter/material.dart';

/// 番号付きリストを作成する
/// WidgetかStringのどちらか1つ引数に入れてください
class NumberList extends StatelessWidget {
  const NumberList({
    Key? key,
    this.children,
    this.texts,
    this.isUseZero = false,
    required this.pereWidth}) : super(key: key);

  final List<Widget>? children;
  final List<String>? texts;
  final bool isUseZero;
  final double pereWidth;

  Widget createNumberList() {
    List<Widget> result = [const SizedBox(height: 12,)];

    if(children != null) {
      for (int i=0; i<children!.length; i++) {
        String index = isUseZero ? i.toString() : (i+1).toString();
        result.add(
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Text(
                    '$index.',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  children![i],
                ],
              ),
            )
        );
      }
    } else {
      for (int i=0; i<texts!.length; i++) {
        String index = isUseZero ? i.toString() : (i+1).toString();
        result.add(
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$index.',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  SizedBox(
                    width: pereWidth,
                    child: Text(texts![i], softWrap: true,),
                  )
                ],
              ),
            )
        );
      }
    }

    return Column(
      children: result,
    );
  }

  @override
  Widget build(BuildContext context) => createNumberList();
}