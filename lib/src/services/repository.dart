import 'package:blogapp/src/services/web_services/blog_api_services.dart';

class Repository {
  BlogApiServices _blogApiServices = BlogApiServices();

  Future<dynamic> userLogin(String email, String password) => _blogApiServices.userSignIn(email, password);

}