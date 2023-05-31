import 'package:ai_glass_v2/pages/message/state.dart';
import 'package:get/get.dart';

import '../../common/routes/names.dart';

class MessageController extends GetxController {
  MessageController();
  final state = MessageState();

  void goProfile() async {
    await Get.toNamed(AppRoutes.Profile);
  }

}
