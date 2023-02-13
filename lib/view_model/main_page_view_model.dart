import 'package:firebase_database/firebase_database.dart';
import 'package:prect/model/config/database_path.dart';
import 'package:prect/model/main_page_state.dart';
import 'package:prect/repository/realtime_database.dart';
import 'package:prect/view_model/database_util.dart';

class MainPageViewModel {

  MainPageNotifier? pageNotifier;

  MainPageViewModel() {
    // アカウント作成やサインイン後、最初にこのページにアクセスするからここで初期化する
    RealtimeDatabase.init();
  }

  Future<Map<double, dynamic>> getChartDataMap(DatabaseLogChild path) async {
    List values = await DatabaseUtil.getContent(path, limit: 168);
    Map<double, dynamic> map = {};
    for (int i=0; i<values.length; i++) {
      map[i.toDouble()] = values[i];
    }
    return map;
  }

  Future<List<Map<double, dynamic>>> createChartData() async {
    List<Map<double, dynamic>> list = [];
    list.add(await getChartDataMap(DatabaseLogChild.moisture));
    list.add(await getChartDataMap(DatabaseLogChild.temperature));
    list.add(await getChartDataMap(DatabaseLogChild.humidity));
    return list;
  }
}