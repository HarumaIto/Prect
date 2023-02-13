import 'package:flutter/material.dart';
import 'package:prect/view_model/scan_wifi.dart';

class ScannedWifiList extends StatefulWidget {
  const ScannedWifiList({Key? key}) : super(key: key);

  @override
  ScannedWifiListState createState() => ScannedWifiListState();
}

class ScannedWifiListState extends State<ScannedWifiList> {
  late final ScanWifiRepository wifiRepository;

  @override
  void initState() {
    // wifiのリポジトリの初期化
    wifiRepository = ScanWifiRepository()..init();
    wifiRepository.startScan();
    super.initState();
  }

  @override
  void dispose() {
    wifiRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScanWifiRepository().init();

    return StreamBuilder(
        stream: wifiRepository.state,
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