import 'package:flutter/material.dart';
import 'package:prect/util/scan_wifi_util.dart';

class ScannedWifiList extends StatefulWidget {
  const ScannedWifiList({Key? key}) : super(key: key);

  @override
  ScannedWifiListState createState() => ScannedWifiListState();
}

class ScannedWifiListState extends State<ScannedWifiList> {
  late final ScanWifiUtil wifiUtil;

  @override
  void initState() {
    // wifiのリポジトリの初期化
    wifiUtil = ScanWifiUtil()..init();
    wifiUtil.startScan();
    super.initState();
  }

  @override
  void dispose() {
    wifiUtil.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScanWifiUtil().init();

    return StreamBuilder(
        stream: wifiUtil.state,
        builder: (context, snapshot) {
          final List<String> nameList;
          if (snapshot.hasData) {
            nameList = snapshot.data as List<String>;
          } else {
            nameList = [];
          }

          return SizedBox(
            height: 200,
            child: Column(
              children: [
                Flexible(
                  child: ListView(
                    children: nameList
                        .map((wifiName) {
                      return ListTile(
                        title: Text(wifiName),
                      );
                    }
                    ).toList(),
                  ),
                ),
              ],
            )
          );
        }
    );
  }
}