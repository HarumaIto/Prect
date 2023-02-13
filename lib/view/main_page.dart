import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prect/model/main_page_state.dart';
import 'package:prect/model/data_class/prect_device.dart';
import 'package:prect/view/device_setup_page.dart';
import 'package:prect/view_model/chart/create_chart.dart';
import 'package:prect/view_model/main_page_view_model.dart';

final mainPageProvider =
  StateNotifierProvider.family<MainPageNotifier, MainPageState, List<Map<double, dynamic>>>(
        (ref, lineBarData) {
          return MainPageNotifier(lineBarData: lineBarData);
        });

// アプリを開いて最初に表示されるMainPage
class MainPage extends ConsumerWidget {
  MainPage({super.key});

  MainPageViewModel viewModel = MainPageViewModel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: FutureBuilder(
        future: viewModel.createChartData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator(),);
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          final pageNotifier = ref.read(mainPageProvider(snapshot.data as List<Map<double, dynamic>>).notifier);
          final pageState = ref.watch(mainPageProvider(snapshot.data as List<Map<double, dynamic>>));
          return Container(
            margin: const EdgeInsets.only(top: 48, left: 16, right: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Prect', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        enableInfiniteScroll: false,
                        height: MediaQuery.of(context).size.height/4, // 親Widgetのサイズも変更できる
                        viewportFraction: 0.99, // 1にするとchartのポップアップ表示が切れ取られる
                        onScrolled: (value) { },
                      ),
                      items: [
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          child: snapshot.hasData ? LineChart(
                            CreateChart().create(
                              barCount: pageState.lineBarData.length,
                              spotMap: pageState.lineBarData,
                            ),
                          ) : Text('データが存在しません'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 24),
                    child: Row(
                      children: [
                        const Text('デバイス情報', style: TextStyle(fontSize: 20),),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DeviceSetupPage()),
                            );
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                  pageState.registeredDevices.isNotEmpty
                      ? ListView.builder(
                    itemCount: pageState.registeredDevices.length,
                    itemBuilder: (context, index) {
                      PrectDevice device = pageState.registeredDevices[index];
                      return Card(
                        child: Column(
                          children: [
                            Text(device.name),
                            Text(device.deviceId.toString()),
                          ],
                        ),
                      );
                    },
                  ) : const Text('登録されたデバイスが存在しません'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}