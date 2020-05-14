import 'package:blogapp/src/business_logic/view_models/signup_viewmodel.dart';
import 'package:blogapp/src/views/utils/contraints.dart';
import 'package:blogapp/src/views/utils/reuseable_widgets.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _nameController, _passwordController, _confirmPasswordController, _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var signUpModelView = Provider.of<SignUpViewModel>(context);
    return ModalProgressHUD(
      inAsyncCall: signUpModelView.inProgress,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover
              )
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: 60,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black87,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'SIGN UP FOR FREE NOW',
                          style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 0.5,
                            wordSpacing: 0.5,
                            color: kSoftWhite
                          )
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.black87,
                    child: ListView(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 16,top: 40),
                            child: Image.asset(
                              'assets/images/quora.png',
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: 30,
                              left: 16,
                              bottom: 8
                          ),
                          child: Text(
                            'WELCOME',
                            style: TextStyle(
                              color: kSoftWhite,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 25,
                            left: 16
                          ),
                          child: Text(
                            'TO BLOG APP',
                            style: TextStyle(
                              color: kSoftWhite,
                              letterSpacing: 0.5,
                              wordSpacing: 0.5
                            ),
                          ),
                        ),
                        SingleLineInputTextField(
                          hintText: 'Full Name',
                          labelText: 'Full Name',
                          obscureText: false,
                          dark: true,
                          enable: true,
                          textEditingController: _nameController,
                        ),
                        SingleLineInputTextField(
                          hintText: 'Email',
                          labelText: 'Email',
                          obscureText: false,
                          dark: true,
                          enable: true,
                          textEditingController: _emailController,
                        ),
                        SingleLineInputTextField(
                          hintText: 'Password',
                          labelText: 'Password',
                          obscureText: true,
                          dark: true,
                          enable: true,
                          textEditingController: _passwordController,
                        ),
                        SingleLineInputTextField(
                          hintText: 'Confirm Password',
                          labelText: 'Confirm Password',
                          obscureText: true,
                          dark: true,
                          enable: true,
                          textEditingController: _confirmPasswordController,
                        ),
                        RoundedRaisedButton(
                          color: kDarkOrange,
                          textColor: kSoftWhite,
                          text: 'SIGN UP',
                          onPress: () async{
                            bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text.trim());
                            if (_nameController.text.trim().isNotEmpty){
                              if (emailValid){
                                if (_passwordController.text.length >= 6){
                                  if (_passwordController.text == _confirmPasswordController.text){
                                    bool result = await signUpModelView.signUp(
                                        _nameController.text.trim(),
                                        _emailController.text.trim(),
                                        _passwordController.text
                                    );
                                    if (result){
                                      Navigator.pushReplacement(context, MaterialPageRoute(
                                        builder: (BuildContext context) => Home()
                                      ));
                                    }
                                  } else {
                                    BotToast.showText(
                                        text: 'Both password does not match!',
                                        contentColor: kDarkOrange,
                                        textStyle: TextStyle(
                                          color: kSoftWhite
                                        )
                                    );
                                  }
                                } else {
                                  BotToast.showText(
                                      text: 'Please enter a passwor more than 6 letters!',
                                      contentColor: kDarkOrange,
                                      textStyle: TextStyle(
                                          color: kSoftWhite
                                      )
                                  );
                                }
                              } else {
                                BotToast.showText(
                                    text: 'Please enter a valid email!',
                                    contentColor: kDarkOrange,
                                    textStyle: TextStyle(
                                        color: kSoftWhite
                                    )
                                );
                              }
                            } else {
                              BotToast.showText(
                                  text: 'Please enter your full name!',
                                  contentColor: kDarkOrange,
                                  textStyle: TextStyle(
                                      color: kSoftWhite
                                  )
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: InkWell(
                            child: Text(
                              'SWIPE RIGHT TO SIGN IN >>',
                              style: TextStyle(
                                color: kSoftWhite,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                                wordSpacing: 0.5
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}