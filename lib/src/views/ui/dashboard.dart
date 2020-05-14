import 'package:blogapp/src/business_logic/models/category_model.dart';
import 'package:blogapp/src/business_logic/view_models/post_viewmodel.dart';
import 'package:blogapp/src/views/utils/contraints.dart';
import 'package:blogapp/src/views/utils/reuseable_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var postViewModel = Provider.of<PostViewModel>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: FutureBuilder(
                future: postViewModel.getCategories(),
                builder: (context, snapshot){
                  return ListView.builder(
                      itemCount: postViewModel.categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                    return Row(
                      children: <Widget>[
                        Chip(
                          label: Text(postViewModel.categories[index].name),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    );
                  });
                },
              )
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(left: 16),
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
