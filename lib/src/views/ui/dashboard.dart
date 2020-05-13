import 'package:blogapp/src/views/utils/contraints.dart';
import 'package:blogapp/src/views/utils/reuseable_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    Chip(
                      backgroundColor: kSoftBlack,
                      label: Text(
                          'All',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: kSoftWhite
                        ),
                      ),
                      elevation: 2,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Chip(
                      label: Text('Following'),
                      elevation: 2,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Chip(
                      label: Text('Fashion & Style'),
                      elevation: 2,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Chip(
                      label: Text('Health & Fitness'),
                      elevation: 2,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Chip(
                      label: Text('Cooking'),
                      elevation: 2,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Chip(
                      label: Text('Entertainment'),
                      elevation: 2,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Chip(
                      label: Text('Skills'),
                      elevation: 2,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Chip(
                      label: Text('Others'),
                      elevation: 2,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(
                    left: 16
                  ),
                  child: Column(
                    children: <Widget>[
                      HeaderWidget(
                        title: 'Recents',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      PostTile(),
                      PostTile(),
                      PostTile(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

