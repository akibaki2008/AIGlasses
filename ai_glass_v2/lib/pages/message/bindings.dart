import 'package:ai_glass_v2/pages/message/controller.dart';
import 'package:get/get.dart';

class MessageBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MessageController>(() => MessageController());
  }
  
}