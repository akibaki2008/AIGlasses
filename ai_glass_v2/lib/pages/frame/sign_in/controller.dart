import 'package:ai_glass_v2/common/entities/entities.dart';
import 'package:ai_glass_v2/common/store/store.dart';
import 'package:ai_glass_v2/common/utils/http.dart';
import 'package:ai_glass_v2/pages/frame/sign_in/state.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../common/routes/names.dart';

class SignInController extends GetxController {
  SignInController();
  final state = SignInState();
  //static const String googleClientId =
      //"825389689824-0donc40unu790c6fm6c8ikgu3tjfv2j5.apps.googleusercontent.com";
//apiKey: 'AIzaSyA5_qEINGfIssms6b5-wEXVsqHKIi7ayOo',
    //appId: '1:825389689824:web:e8c51aaf69f613a35c1985',
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      "openid"
    ], // use my google account and the same password for it it used
    //clientId: googleClientId,
    
  );

  void handleSignIn(String type) async {
    // 1: Google, 2: Facebook, 3:apple,
    try {
      if (type == 'phone number') {
        print("...you are logging in with phone number...");
      } else if (type == "google") {
        var user = await _googleSignIn.signIn();
        if (user != null) {
          String? displayName = user.displayName;
          String email = user.email;
          String id = user.id;
          LoginRequestEntity loginPanelListRequestEntity = LoginRequestEntity();
          loginPanelListRequestEntity.open_id = id;
          loginPanelListRequestEntity.name = displayName;
          loginPanelListRequestEntity.email = email;
          loginPanelListRequestEntity.type = 2;
        }
      } else {
        print("UNKOWN LOGIN TYPE");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
