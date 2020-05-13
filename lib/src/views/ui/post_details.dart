import 'package:blogapp/src/views/utils/contraints.dart';
import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.asset(
                    'assets/images/bg.jpg',
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close, color: kDarkOrange, size: 30,),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Title will be here',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '12:29AM . 12 July, 2020',
                      style: TextStyle(
                        fontSize: 12
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.play_circle_filled,
                        color: kDarkOrange,
                      ),
                      title: Text(
                        'Play Video'
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Its ancestors must include Material, MediaQuery, Directionality, and MaterialLocalizations. Typically all of these widgets are provided by MaterialApp and Scaffold. The label and clipBehavior arguments must not be null.',
                      softWrap: true,
                      maxLines: 4,
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 0.3,
                        wordSpacing: 0.3,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.favorite,
                          color: kDarkOrange,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '12004'
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.thumb_up,
                          color: kSoftWhite,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                            '12004'
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/quora.png'),
                      ),
                      title: Text('Username'),
                      subtitle: Text('Following', style: TextStyle(color: kDarkOrange),),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
