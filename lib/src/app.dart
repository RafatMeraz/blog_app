import 'package:blogapp/src/services/shared_pref_services/shared_pref_services.dart';
import 'package:blogapp/src/views/ui/authenticate_page.dart';
import 'package:blogapp/src/views/ui/home.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'business_logic/model_view/signup_modelview.dart';

class BlogApp extends StatefulWidget {
  @override
  _BlogAppState createState() => _BlogAppState();
}

class _BlogAppState extends State<BlogApp> {
  @override
  void initState() {
    super.initState();
    SharedPrefServices.init();
    checkAlreadyLoggedIn();
  }

  checkAlreadyLoggedIn(){
    if (SharedPrefServices.getString('email') != null){
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (BuildContext context) => Home()
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignUpModelView>(create: (context)=> SignUpModelView(),),
      ],
      child: MaterialApp(
        title: 'Blog App',
        theme: ThemeData(
          fontFamily: 'BaiJamjuree'
        ),
        builder: BotToastInit(), //1. call BotToastInit
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        home: AuthencatePage(),
      ),
    );
  }
}
