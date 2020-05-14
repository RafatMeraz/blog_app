import 'dart:convert';
import 'package:blogapp/src/business_logic/models/category_model.dart';
import 'package:blogapp/src/business_logic/utils/constants.dart';
import 'package:blogapp/src/services/shared_pref_services/shared_pref_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const baseURL = "https://pirox-foodapi.000webhostapp.com/";
class BlogApiServices {
  http.Client client = http.Client();
//  static String token;

//  BlogApiServices(){
//    token = getToken();
//  }

  // get the base url response
  Future<dynamic> fetchBaseUrl() async{
    try{
      var response = await client.get(baseURL);
      if (response.statusCode == 200){
        return jsonDecode(response.body);
      } else {
        return response.statusCode;
      }
    } catch (e){
      print(e.toString());
    }
  }

  // user sign up method
  Future<dynamic> userSignUp(String name, String email, String password) async{
    try{
      var response = await client.post(baseURL+'signUp', body: {
        'name': name,
        'email': email,
        'password': password
      });
      if (response.statusCode == 200){
        return jsonDecode(response.body);
      } else {
        return response.statusCode;
      }
    } catch (e){
      print(e.toString());
    }
  }

  // user sign in method
  Future<dynamic> userSignIn(String email, String password) async{
    try{
      var response = await client.post(baseURL+'signIn', body: {
        'email': email,
        'password': password
      });
      if (response.statusCode == 200){
        return jsonDecode(response.body);
      } else {
        return response.statusCode;
      }
    } catch (e){
      print(e.toString());
    }
  }

  // user sign in method
  Future<dynamic> getUserDetailsFromEmail(String email) async{
    try{
      var response = await client.post(baseURL+'getUserDetailsFromEmail', body: {
        'email': email,
        'api_token': Constants.api_token
      });
      if (response.statusCode == 200){
        return jsonDecode(response.body);
      } else {
        return response.statusCode;
      }
    } catch (e){
      print(e.toString());
    }
  }

  // get all category
  Future<dynamic> getCategories() async{
    try{
      var response = await client.post(baseURL+'categories', body: {
        'api_token': Constants.api_token
      });
      if (response.statusCode == 200){
        return jsonDecode(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e){
      print(e.toString());
    }
  }

  // post a new blog
  Future<dynamic> postNewBlog(String title, String image, String videoUrl, String content) async{
    try{
      var response = await client.post(baseURL+'signIn', body: {
        'api_token': SharedPrefServices.getString('api_token'),
        'title': title,
        'url': videoUrl,
        'description': content
      });
      if (response.statusCode == 200){
        return jsonDecode(response.body);
      } else {
        return response.statusCode;
      }
    } catch (e){
      print(e.toString());
    }
  }

  static String getToken(){
    SharedPrefServices.init();
    return SharedPrefServices.getString('api_token');
  }
}