import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prect/ui/view/step/complete_step.dart';
import 'package:prect/ui/view/step/setup_description_step.dart';
import 'package:prect/ui/view/step/wifi_access_step.dart';
import 'package:prect/ui/view/step/write_infomation_step.dart';
import '../../model/ui_state/device_setup_page_state.dart';
import '../view_model/device_setup_page_view_model.dart';
import 'main_page.dart';

final deviceSetupPageProvider = StateNotifierProvider<DeviceSetupPageNotifier, DeviceSetupPageState>((_) {
  return DeviceSetupPageNotifier();
});

class DeviceSetupPage extends ConsumerWidget {
  DeviceSetupPage({Key? key}) : super(key: key);

  final DeviceSetupPageViewModel viewModel = DeviceSetupPageViewModel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    viewModel.widgetRef = ref;
    final pageNotifier = ref.read(deviceSetupPageProvider.notifier);
    final pageState = ref.watch(deviceSetupPageProvider);

    List<Step> steps = [
      Step(
        title: const Text('説明'),
        // Widgetの大きさを取得する際に必要
        content: viewModel.isStepEqual(0) ? SetupDescriptionStep() : Container(),
        isActive: viewModel.isStepEqual(0),
      ),
      Step(
        title: const Text('アクセス'),
        content: viewModel.isStepEqual(1) ? WifiAccessStep(viewModel) : Container(),
        isActive: viewModel.isStepEqual(1),
      ),
      Step(
        title: const Text('書き込み'),
        content: viewModel.isStepEqual(2) ? WriteInformationStep(viewModel) : Container(),
        isActive: viewModel.isStepEqual(2),
      ),
      Step(
        title: const Text('完了'),
        content: viewModel.isStepEqual(3) ? CompleteStep() : Container(),
        isActive: viewModel.isStepEqual(3),
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('セットアップ'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            pageNotifier.reset();
            Navigator.maybePop(context);
          },
        ),
      ),
      body: Stepper(
        currentStep: pageState.stepperIndex,
        controlsBuilder: (context, details) {
          return Row(
            children: [
              if (pageState.stepperIndex != steps.length-1)
                TextButton(
                  onPressed: details.onStepContinue,
                  child: const Text('次へ'),
                ),
              if (pageState.stepperIndex != 0 && pageState.stepperIndex != steps.length-1)
                TextButton(
                  onPressed: details.onStepCancel,
                  child: const Text('戻る'),
                ),
              if (pageState.stepperIndex == steps.length-1)
                TextButton(
                  onPressed: () {
                    pageNotifier.stepperIndex = 0;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  },
                  child: const Text('とじる'),
                ),
            ],
          );
        },
        onStepCancel: () {
          if (pageState.stepperIndex != 0) {
            pageNotifier.stepperIndex = pageState.stepperIndex-1;
          }
        },
        onStepContinue: () {
          if (pageState.stepperIndex != steps.length-1) {
            pageNotifier.stepperIndex = pageState.stepperIndex+1;
          }
        },
        onStepTapped: (int index) {
          pageNotifier.stepperIndex = index;
        },
        steps: steps,
      ),
    );
  }
}