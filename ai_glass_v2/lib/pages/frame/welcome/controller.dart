import 'package:ai_glass_v2/pages/frame/welcome/state.dart';
import 'package:get/get.dart';

import '../../../common/routes/names.dart';

class WelcomeController extends GetxController {
  WelcomeController();
  final title = "AI Glass Copilot";
  final state = WelcomeState();

  @override
  void onReady() {
    super.onReady();
    Future.delayed(
        Duration(seconds: 4), () => Get.offAllNamed(AppRoutes.Message));
  }
}
