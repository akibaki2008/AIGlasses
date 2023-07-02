import 'package:flutter/material.dart';
import 'package:ai_glass_v2/common/routes/routes.dart';
import 'package:ai_glass_v2/common/store/store.dart';

import 'package:get/get.dart';

/// 检查是否登录
class RouteAuthMiddleware extends GetMiddleware {
  // priority 数字小优先级高
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (
      //UserStore.to.isLogin ||
        route == AppRoutes.SIGN_IN ||
        route == AppRoutes.INITIAL) {
      return null;
    } else {
      Future.delayed(const Duration(seconds: 2),
          () => Get.snackbar("Tips", "Login expired, please login again!"));
      return const RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
//This will route from welcome to signinpage before messages if user has not authenticated.  


//This Flutter code is a middleware class that it used to handle routing in Flutter application, specifically focusing on user
// authentication. It uses the GetX package which is an extra-light and powerful solution for Flutter.

//Import Statements: These are the libraires and pckages that are being used in this file. material.dart is the material
// design library in Flutter, the ai_glass_v2 imports are specific packages in your application, and get.dart is the GetX
//library.

// RouteAuthMiddleware: This class is a subclass of GetMiddleware which is a part of the GetX library. It allows you 
// to handl eroute events and manage redirection in your application. The RouteAuthMiddleware class is a custom 
// middleware that's being used to check if a user is authenticated or not when navigating between routes.

// Priority variable: The priority variable is sued to determine the order in which middleware should be run when there
// are multiple middleware classes in a Getx application. The middleware with the lowest priority runs the first time.
// If there are multiple middleware with the same priority, the ordered they run is not defined. In this specific case,
// the routhAuthmiddleware class as a priority of 0 meaning it would be run before any other middleware with a higher 
//priority number. 
// This makes sense becasue it's typically importnat to check if a user is authenticated before doing other types
//of route-related processing. For example, if you have a middleware that logs user activity or one that laods data
//related to a route, you wouldn't want those to run if the user isn't authenticated. So 'RouteAuthMiddleare would run
//first because of its low priority number, and if the user isn't authenticated, they would be redirected before the other middlewares run. 

// RouteAuthMiddleware: constructor: This constructor is initialize the priority variable.

//redirect method: This methos is called whenever a route is being accessed. It checks if the current route is either
// SIGN_IN or INITIAL. If it is, the user is allowed to continue to that route be returning null. If it's any other
// route, the method assumes the user's login has expired, shows a Sbackbar message to the user telling them their login
// has expired and they need to log in again, and then redirects them to the SIGN_IN Page.
