import 'package:blogapp/src/business_logic/models/category_model.dart';
import 'package:blogapp/src/services/web_services/blog_api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostViewModel with ChangeNotifier{
  BlogApiServices _blogApiServices = BlogApiServices();
  bool inProgress = false;
  List<Category> categories = List<Category>();

  getCategories() async{
    categories.clear();
    var jsonResponse = await _blogApiServices.getCategories();
    print(jsonResponse);
    for (int i=0; i<jsonResponse.length; i++){
      categories.add(Category.fromJson(jsonResponse[i]));
    }
    print(categories.length);
  }
}