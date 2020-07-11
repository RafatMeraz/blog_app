import 'package:blogapp/src/business_logic/blocs/login_bloc.dart';
import 'package:blogapp/src/business_logic/blocs/login_states.dart';
import 'package:blogapp/src/business_logic/blocs/signup_bloc.dart';
import 'package:blogapp/src/business_logic/blocs/signup_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/app.dart';

main() {
  MultiBlocProvider blocProvider = MultiBlocProvider(
    providers: [
      BlocProvider<LoginBloc>(
        create: (_) => LoginBloc(LoginInitialState()),
      ),
      BlocProvider<SignUpBloc>(
        create: (_) => SignUpBloc(SignUpInitialState()),
      )
    ],
    child: BlogApp(),
  );
  runApp(blocProvider);
}