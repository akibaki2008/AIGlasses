import 'package:ai_glass_v2/common/entities/entities.dart';
import 'package:ai_glass_v2/common/store/store.dart';
import 'package:ai_glass_v2/common/utils/http.dart';
import 'package:ai_glass_v2/pages/frame/sign_in/state.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../common/routes/names.dart';

class SignInController extends GetxController {
  SignInController();
  final state = SignInState();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['openid']);

  void handleSignIn(String type) async{
    try {
      if (type == "phone number") {
        print("...you are logging in with a phone number ..");
      } else if (type == "google") {
        var user = await _googleSignIn.signIn();
        if (user != null) {
          String? displayName = user.displayName;
          String email = user.email;
          String id = user.id;
          String photoUrl = user.photoUrl ?? "assets/icons/google.png";
          LoginRequestEntity loginPanellRequestEntity =  LoginRequestEntity();
          loginPanellRequestEntity.avatar = photoUrl;
          loginPanellRequestEntity.name = displayName;
          loginPanellRequestEntity.email = email;
          loginPanellRequestEntity.open_id = id;
          loginPanellRequestEntity.type= 2;
          asyncPostAllData();
        }
      } else {
        print("...login type not sure ..");
      }
    } catch (e) {
      print('...error with login $e');
    }
  }

  asyncPostAllData() async{
   var response = await HttpUtil().get(
      '/api/index'
    );
    print(response);
    UserStore.to.setIsLogin = true;
    Get.offAllNamed(AppRoutes.Message);
  }
}
