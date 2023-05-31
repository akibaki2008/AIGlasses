import 'package:ai_glass_v2/pages/frame/welcome/controller.dart';
import 'package:get/get.dart';
// The first import is for a custom contoreller class.
// The second import is the get pakcage which provides dependnecy injection capabilities

class WelcomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }
  
}
// The WelcomeBinding class is defined and implemtns the Bindings interface.
// By implementing this interface, the class needs to provide an implementation
// for the dependneices() method. 





//__________________________________________________________________
//This flutter code snippet is defining a 'WelcomeBinding' class that implements the
//Bindings interface from the 'getx' package. The purpose of a binding class in flutter
// is to define dependencies for a specific route or screen, ensuring that the required
// dependneices are available before navigating to that screen.

