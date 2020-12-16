import 'package:get/get.dart';
import 'package:learn_mcu/models/swithcModel.dart';
import 'package:learn_mcu/services/databaseService.dart';

class SwitchController extends GetxController {
  Rx<SwitchModel> _switchModel = Rx<SwitchModel>();
  String get switchValue => _switchModel.value?.value;
  String get swithcStatus => _switchModel.value?.status;
  @override
  void onInit() {
    super.onInit();
    _switchModel.bindStream(DatabaseService().switchStream());
  }
}
