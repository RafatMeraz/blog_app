import 'package:blogapp/src/business_logic/models/category_model.dart';
import 'package:blogapp/src/views/utils/reuseable_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../business_logic/blocs/posts/post_bloc.dart';
import '../../business_logic/blocs/posts/post_events.dart';
import '../../business_logic/blocs/posts/post_states.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostBloc>(context).add(GetAllPosts(id: '1'));
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
              title: 'Recent',
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child:  BlocBuilder(
                bloc: BlocProvider.of<PostBloc>(context),
                builder: (context, state){
                  if (state is PostsLoadingState){
                    return Center(child: CircularProgressIndicator());
                  } else if (state is PostsEmptyState){
                    return Center(
                      child: Text(
                          'There is no post yet!'
                      ),
                    );
                  } else if (state is PostsFetchedState){
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: state.allPosts.length,
                        itemBuilder: (context, index){
                          return PostTile(
                            blog: state.allPosts[index],
                          );
                        });
                  } else if (state is PostsErrorState){
                    return Center(
                      child: Text(
                          'Something went wrong!'
                      ),
                    );
                  } else if (state is PostsFetchFailedState){
                    return Center(
                      child: Text(
                          'Failed to fetch posts!'
                      ),
                    );
                  } else if (state is PostsInitialState){
                    Center(child: CircularProgressIndicator());
                  }
                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
