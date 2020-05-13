import 'package:blogapp/src/services/shared_pref_services/shared_pref_services.dart';
import 'package:blogapp/src/services/web_services/blog_api_services.dart';
import 'package:blogapp/src/views/utils/contraints.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';

class SignUpModelView with ChangeNotifier{
  BlogApiServices _blogApiServices = BlogApiServices();
  bool inProgress = false;

  Future<dynamic> signUp(String name, String email, String password) async{
    inProgress = true;
    notifyListeners();
    var _response = await _blogApiServices.userSignUp(name, email, password);
    inProgress = false;
    notifyListeners();
    if (_response['error']){
      BotToast.showText(
          text: _response['status'],
          contentColor: kDarkOrange,
          textStyle: TextStyle(
              color: kSoftWhite
          )
      );
    } else {
    }
  }
}