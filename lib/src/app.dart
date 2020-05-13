import 'package:blogapp/src/views/ui/authenticate_page.dart';
import 'package:flutter/material.dart';

class BlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      theme: ThemeData(
        fontFamily: 'BaiJamjuree'
      ),
      debugShowCheckedModeBanner: false,
      home: AuthencatePage(),
    );
  }
}
