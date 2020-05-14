import 'package:blogapp/src/business_logic/model_view/signin_modelview.dart';
import 'package:blogapp/src/services/shared_pref_services/shared_pref_services.dart';
import 'package:blogapp/src/views/ui/authenticate_page.dart';
import 'package:blogapp/src/views/ui/home.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'business_logic/model_view/signup_modelview.dart';

class BlogApp extends StatefulWidget {
  @override
  _BlogAppState createState() => _BlogAppState();
}

class _BlogAppState extends State<BlogApp> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
  }

   Future<bool> checkSignin() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs.getString('api_token') != null){
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignUpModelView>(create: (context)=> SignUpModelView(),),
        ChangeNotifierProvider<SignInModelView>(create: (context)=> SignInModelView(),),
      ],
      child: MaterialApp(
        title: 'Blog App',
        theme: ThemeData(
          fontFamily: 'BaiJamjuree'
        ),
        builder: BotToastInit(), //1. call BotToastInit
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        home: checkSignin() != null ? Home() : AuthencatePage() ,
      ),
    );
  }
}
