import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:prect/model/config/database_path.dart';
import 'package:prect/view_model/database_util.dart';

class CreateChart {
  final List<Color> barColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
  ];

  int barCount = 0;
  int spotMapLength = 0;
  List<Map<double, dynamic>> spotMap = [];

  LineChartData create({
    required int barCount,
    required List<Map<double, dynamic>> spotMap,
  }) {
    this.barCount = barCount;
    this.spotMap = spotMap;
    spotMapLength = this.spotMap.length;
    return lineChartData;
  }
  // 外部から呼ばれる
  LineChartData get lineChartData => LineChartData(
    backgroundColor: Colors.grey[200],
    lineTouchData: lineTouchData,
    gridData: gridData,
    titlesData: titlesData,
    lineBarsData: lineBarsData,
    minX: spotMap[0].keys.first,
    maxX: spotMap[0].keys.last,
    maxY: 100,
    minY: 0,
  );

  LineTouchData get lineTouchData => LineTouchData(
    handleBuiltInTouches: true,
    touchTooltipData: LineTouchTooltipData(
      tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
    ),
  );

  FlTitlesData get titlesData => FlTitlesData(
    bottomTitles: AxisTitles(
      sideTitles: bottomTitles,
      axisNameWidget: Row(
        children: [
          bottomBarWidget(Colors.red),
          bottomTextWidget('水分量'),
          bottomBarWidget(Colors.blue),
          bottomTextWidget('温度'),
          bottomBarWidget(Colors.green),
          bottomTextWidget('湿度'),
          const Spacer(),
          const Text(
            '時間',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    ),
    rightTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    leftTitles: AxisTitles(
      sideTitles: leftTitles(),
    ),
  );

  List<LineChartBarData> get lineBarsData {
    final list = <LineChartBarData>[];
    for (var i=0; i<barCount; i++) {
      list.add(lineChartBarData(i, spotMap[i]));
    }
    return list;
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff75729e),
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 25:
        text = '25';
        break;
      case 50:
        text = '50';
        break;
      case 75:
        text = '75';
        break;
      case 100:
        text = '100';
        break;
      default:
        return Container();
    }
    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
    getTitlesWidget: leftTitleWidgets,
    showTitles: true,
    interval: 1,
  );

  Widget bottomTitleWidgets(double xValue, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff72719b),
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text;
    switch (xValue.toInt()) {
      case 0:
        DateTime date = DatabaseUtil.getDateForTimestamp(xValue.toInt());
        text = '${date.month}-${date.day} ${date.hour}:${date.minute}';
        break;
      case 50:
        DateTime date = DatabaseUtil.getDateForTimestamp(xValue.toInt());
        text = '${date.month}-${date.day} ${date.hour}:${date.minute}';
        break;
      case 100:
        DateTime date = DatabaseUtil.getDateForTimestamp(xValue.toInt());
        text = '${date.month}-${date.day} ${date.hour}:${date.minute}';
        break;
      case 150:
        DateTime date = DatabaseUtil.getDateForTimestamp(xValue.toInt());
        text = '${date.month}-${date.day} ${date.hour}:${date.minute}';
        break;
      case 200:
        DateTime date = DatabaseUtil.getDateForTimestamp(xValue.toInt());
        text = '${date.month}-${date.day} ${date.hour}:${date.minute}';
        break;
      default:
        return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  SideTitles get bottomTitles => SideTitles(
    showTitles: true,
    interval: 1,
    getTitlesWidget: bottomTitleWidgets,
  );

  FlGridData get gridData => FlGridData(
    show: true,
    horizontalInterval: 25,
    verticalInterval: 5,
  );

  LineChartBarData lineChartBarData(int index, Map<double, dynamic> map) {
    return LineChartBarData(
      isCurved: false,
      color: barColors[index],
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      spots: convertMapToSpotList(map),
    );
  }

  List<FlSpot> convertMapToSpotList(Map<double, dynamic> map) {
    final list = <FlSpot>[];
    final keys = map.keys;
    final values = map.values;
    for (var i=0; i<map.length; i++) {
      list.add(FlSpot(
        keys.elementAt(i),
        // toDouble()じゃないとエラーが起きる
        values.elementAt(i).toDouble(),
      ),);
    }
    return list;
  }

  // Widget
  Widget bottomBarWidget(Color color) {
    return Container(
      margin: const EdgeInsets.only(top: 3),
      height: 4,
      width: 16,
      color: color,
    );
  }

  Widget bottomTextWidget(String text) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Text(text , style: const TextStyle(fontSize: 12,)),
    );
  }
}
