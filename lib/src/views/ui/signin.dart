import 'package:blogapp/src/views/ui/home.dart';
import 'package:blogapp/src/views/utils/contraints.dart';
import 'package:blogapp/src/views/utils/reuseable_widgets.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          text: 'SIGN IN TO YOUR ACCOUNT',
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
                          'WELCOME BACK',
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
                      RoundedRaisedButton(
                        color: kDarkOrange,
                        textColor: kSoftWhite,
                        text: 'SIGN IN',
                        onPress: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (BuildContext context) => Home()
                          ));
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
                            '<< SWIPE LEFT TO SIGN UP',
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
    );
  }
}

