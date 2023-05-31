import 'package:ai_glass_v2/pages/frame/sign_in/controller.dart';
import 'package:get/get.dart';


class SignInBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
  
}
