import 'package:blogapp/src/services/web_services/blog_api_services.dart';
import 'package:flutter/cupertino.dart';

class SignUpModelView with ChangeNotifier{
  BlogApiServices _blogApiServices = BlogApiServices();
  bool inProgress = false;

  Future<dynamic> signUp(String name, String email, String password) async{
    inProgress = true;
    notifyListeners();
    var _response = await _blogApiServices.userSignUp(name, email, password);
    inProgress = false;
    if (_response['error']){
      print(_response['status']);
    } else {

    }
  }
}