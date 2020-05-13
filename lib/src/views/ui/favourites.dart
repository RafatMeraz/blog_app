import 'package:blogapp/src/views/utils/contraints.dart';
import 'package:blogapp/src/views/utils/reuseable_widgets.dart';
import 'package:flutter/material.dart';

class Favourites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            HeaderWidget(
              title: 'Favourites',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            'assets/images/bg.jpg'
                          ),
                        ),
                        title: Text(
                          'Title here'
                        ),
                        subtitle: Text(
                          'I do not know anything about your future at all. You have to decide what will you want to be.',
                          maxLines: 2,
                        ),
                        trailing: InkWell(
                          onTap: (){},
                          child: Icon(
                            Icons.delete_outline,
                            color: kDarkOrange,
                          ),
                        ),
                      ),
                      Divider(
                        indent: 10,
                        endIndent: 10,
                      ),
                      ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            'assets/images/bg.jpg'
                          ),
                        ),
                        title: Text(
                          'Title here'
                        ),
                        subtitle: Text(
                          'I do not know anything about your future at all. You have to decide what will you want to be.',
                          maxLines: 2,
                        ),
                        trailing: InkWell(
                          onTap: (){},
                          child: Icon(
                            Icons.delete_outline,
                            color: kDarkOrange,
                          ),
                        ),
                      ),
                      Divider(
                        indent: 10,
                        endIndent: 10,
                      ),
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
