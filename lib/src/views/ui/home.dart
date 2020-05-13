import 'package:blogapp/src/views/ui/dashboard.dart';
import 'package:blogapp/src/views/ui/following.dart';
import 'package:blogapp/src/views/ui/likes.dart';
import 'package:blogapp/src/views/ui/profile.dart';
import 'package:blogapp/src/views/ui/search.dart';
import 'package:blogapp/src/views/ui/write_post.dart';
import 'package:blogapp/src/views/utils/contraints.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'favourites.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

enum Buttons{
  dashboard,
  write,
  search,
  favourites,
  following,
  likes,
  profiles
}

class _HomeState extends State<Home> {
  int index = 0;
  int _selectedIndex = 0;

  changeIndex(int i){
    setState(() {
      index = i;
    });
  }
  final List<Widget> screens = [
    Dashboard(),
    WritePost(),
    Search(),
    Favourites(),
    Following(),
    Likes(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: <Widget>[
//            Container(
//              color: kSoftBlack,
//              width: 60,
//              height: MediaQuery.of(context).size.height,
//              child: Column(
//                children: <Widget>[
//                  SizedBox(
//                    height: 20,
//                  ),
//                  IconButton(
//                    tooltip: 'Home',
//                    iconSize: 25,
//                    onPressed: () {
//                      changeIndex(0);
//                    },
//                    icon: Icon(
//                      Icons.dashboard,
//                      color: index == 0 ?  kDarkOrange : kSoftWhite,
//                    ),
//                  ),
//                  SizedBox(
//                    height: 15,
//                  ),
//                  IconButton(
//                    tooltip: 'Write Post',
//                    iconSize: 25,
//                    onPressed: () {
//                      changeIndex(1);
//                    },
//                    icon: Icon(
//                      Icons.edit,
//                      color: index == 1 ?  kDarkOrange : kSoftWhite,
//                    ),
//                  ),
//                  SizedBox(
//                    height: 15,
//                  ),
//                  IconButton(
//                    tooltip: 'Search',
//                    iconSize: 25,
//                    onPressed: () {
//                      changeIndex(2);
//                    },
//                    icon: Icon(
//                      Icons.search,
//                      color: index == 2 ?  kDarkOrange : kSoftWhite,
//                    ),
//                  ),
//                  SizedBox(
//                    height: 15,
//                  ),
//                  IconButton(
//                    tooltip: 'Favourites',
//                    iconSize: 25,
//                    onPressed: () {
//                      changeIndex(3);
//                    },
//                    icon: Icon(
//                      Icons.favorite_border,
//                      color: index == 3 ?  kDarkOrange : kSoftWhite,
//                    ),
//                  ),
//                  SizedBox(
//                    height: 15,
//                  ),
//                  IconButton(
//                    tooltip: 'Following',
//                    iconSize: 25,
//                    onPressed: () {
//                      changeIndex(4);
//                    },
//                    icon: Icon(
//                      Icons.supervised_user_circle,
//                      color: index == 4 ?  kDarkOrange : kSoftWhite,
//                    ),
//                  ),
//                  SizedBox(
//                    height: 15,
//                  ),
//                  IconButton(
//                    tooltip: 'Likes',
//                    iconSize: 25,
//                    onPressed: () {
//                      changeIndex(5);
//                    },
//                    icon: Icon(
//                      Icons.thumb_up,
//                      color: index == 5 ?  kDarkOrange : kSoftWhite,
//                    ),
//                  ),
//                  SizedBox(
//                    height: 15,
//                  ),
//                  IconButton(
//                    tooltip: 'Profile',
//                    iconSize: 25,
//                    onPressed: () {
//                      changeIndex(6);
//                    },
//                    icon: Icon(
//                      Icons.person,
//                      color: index == 6 ?  kDarkOrange : kSoftWhite,
//                    ),
//                  ),
//                  SizedBox(
//                    height: 20,
//                  ),
//                ],
//              ),
//            ),
            Container(
              width: 60,
              child: NavigationRail(
                selectedIconTheme: IconThemeData(
                  color: kDarkOrange,
                  size: 30
                ),
                selectedLabelTextStyle: TextStyle(
                  color: kDarkOrange,
                  fontSize: 0
                ),
                unselectedIconTheme: IconThemeData(
                  color: kSoftWhite,
                ),
                backgroundColor: kSoftBlack,
                selectedIndex: _selectedIndex,
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                labelType: NavigationRailLabelType.none,
                elevation: 3,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.dashboard),
                    label: Text('Dashboard'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.edit),
                    label: Text('Write Post'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.search),
                    label: Text('Search'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite_border),
                    label: Text('Favourites'),
                  ),
                  NavigationRailDestination(
                    icon: FaIcon(
                      FontAwesomeIcons.users
                    ),
                    label: Text('Following'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.thumb_up),
                    label: Text('Likes'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.person),
                    label: Text('Profile'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: screens[_selectedIndex]
            )
          ],
        ),
      ),
    );
  }
}
