import 'package:blogapp/src/business_logic/models/blog.dart';
import 'package:blogapp/src/business_logic/models/category_model.dart';
import 'package:blogapp/src/business_logic/view_models/post_viewmodel.dart';
import 'package:blogapp/src/views/utils/contraints.dart';
import 'package:blogapp/src/views/utils/reuseable_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;
  PostViewModel _postViewModel;
  var allPosts =  Container(
      margin: EdgeInsets.only(left: 16),
      child: Center(
          child: CircularProgressIndicator(
            backgroundColor: kDarkOrange,
          )
      )
  );

  @override
  void initState() {
    _postViewModel = new PostViewModel();
    super.initState();
    getPosts();
  }

  getPosts() async{
    var posts = await _postViewModel.getPosts();
    allPosts = Container(
        margin: EdgeInsets.only(left: 16),
        child: posts == null ? Center(
            child: Text(
              'Posts is empty',
            )
        ) : ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: posts.length,
            itemBuilder: (context, index){
              return PostTile(
                blog: posts[index],
              );
            })
    );
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    var catergoriesList = Provider.of<List<Category>>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: catergoriesList == null ? LinearProgressIndicator() : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: catergoriesList.length,
                  itemBuilder: (context, index){
                return Row(
                  children: <Widget>[
                    Chip(
                      label: Text(catergoriesList[index].name),
                      elevation: 2,
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                );
              })
            ),
            HeaderWidget(
              title: 'Recents',
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: allPosts,
            )
          ],
        ),
      ),
    );
  }
}
