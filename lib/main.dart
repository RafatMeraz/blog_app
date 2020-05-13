import 'package:blogapp/src/services/shared_pref_services/shared_pref_services.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';

main() {
  SharedPrefServices.init();
  runApp(BlogApp());
}