import 'package:blogapp/src/services/shared_pref_services/shared_pref_services.dart';
import 'package:blogapp/src/views/ui/signin.dart';
import 'package:blogapp/src/views/ui/signup.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class AuthencatePage extends StatefulWidget {
  @override
  _AuthencatePageState createState() => _AuthencatePageState();
}

class _AuthencatePageState extends State<AuthencatePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          SignIn(),
          SignUp(),
        ],
      ),
    );
  }
}
