import 'package:blogapp/src/business_logic/model_view/profile_viewmodel.dart';
import 'package:blogapp/src/business_logic/model_view/signin_viewmodel.dart';
import 'package:blogapp/src/services/shared_pref_services/shared_pref_services.dart';
import 'package:blogapp/src/views/ui/authenticate_page.dart';
import 'package:blogapp/src/views/ui/home.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'business_logic/model_view/signup_viewmodel.dart';

class BlogApp extends StatefulWidget {
  @override
  _BlogAppState createState() => _BlogAppState();
}

class _BlogAppState extends State<BlogApp> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignUpViewModel>(create: (context)=> SignUpViewModel(),),
        ChangeNotifierProvider<SignInViewModel>(create: (context)=> SignInViewModel(),),
        ChangeNotifierProvider<ProfileViewModel>(create: (context)=> ProfileViewModel(),),
      ],
      child: MaterialApp(
        title: 'Blog App',
        theme: ThemeData(
          fontFamily: 'BaiJamjuree'
        ),
        builder: BotToastInit(), //1. call BotToastInit
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        home: AuthencatePage() ,
      ),
    );
  }
}
