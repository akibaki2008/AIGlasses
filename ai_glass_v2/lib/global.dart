import 'package:ai_glass_v2/common/services/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:ai_glass_v2/common/store/store.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

class Global {
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.web
    );
    await Get.putAsync(()=>StorageService().init());
    Get.put<UserStore>(UserStore());
  }
}

//This code sets up the initialization of the Global class and provides an instance of 'UserStore'
// that can be accessed throughout the Flutter application using the GetX package. So basically
// this is needed so that we do the dpendnecy injection before the router middleware class 
// starts checking. 

//Imported Statements: The imported libraries are the Flutter Cupertino library(which provides
//ios-style widgets), the GetX library(a state managment solution), and your application's store.dart.

// Global class: This is a class that seems to be used to perform some global setup for your 
// application..

//init method: This is a static method in the 'Global' class. Being static means it belongs to 
// the Global class itslef and not to instances of the Global class. This method is asynchronous, which means it returns
// a Future and can perform operations that might take some time to complete.

// WidgetsFlutterBinding.ensureInitialized(): The line is typically used in the 'main' function to ensure that the 
// Flutter widget binding is initialized. This is especially important if you're running code before calling 'runApp', 
// such as accessing platform-specific services or if you're using the firebase_core packages.

// Get.put<UserStore>(UserStore()): This line creates an instance of 'UserStore' and makes it available for all the children
// if this widget through the GetX package. Get.put is a simple way to instantiate and provide a class as a dependency.
// Whenever 'UserStore' is needed in the application, it can now be accessed using Get.find<UserStore>().

// In summary, the 'Global' class is used for performing global setup operations for your application. In its 'init' 
// methodit ensures that the widget binidng is initilaized and creates a globally available instance of 'UserStore'