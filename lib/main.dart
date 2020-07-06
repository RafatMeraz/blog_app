import 'package:blogapp/src/business_logic/blocs/login_bloc.dart';
import 'package:blogapp/src/business_logic/blocs/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/app.dart';

main() {
  MultiBlocProvider blocProvider = MultiBlocProvider(
    providers: [
      BlocProvider<LoginBloc>(
        create: (_) => LoginBloc(LoginInitialState()),
      )
    ],
    child: BlogApp(),
  );
  runApp(blocProvider);
}