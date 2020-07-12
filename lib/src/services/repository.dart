import 'package:blogapp/src/business_logic/models/blog.dart';
import 'package:blogapp/src/services/web_services/blog_api_services.dart';

class Repository {
  BlogApiServices _blogApiServices = BlogApiServices();

  Future<dynamic> userLogin(String email, String password) => _blogApiServices.userSignIn(email, password);

  Future<dynamic> userSignUp(String name, String email, String password) => _blogApiServices.userSignUp(name, email, password);

  Future<dynamic> getAllPosts(String categoryId) => _blogApiServices.getPosts(categoryId);
}