import 'package:blogapp/src/views/ui/signin.dart';
import 'package:blogapp/src/views/ui/signup.dart';
import 'package:flutter/material.dart';

class AuthencatePage extends StatefulWidget {
  @override
  _AuthencatePageState createState() => _AuthencatePageState();
}

class _AuthencatePageState extends State<AuthencatePage> {
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
