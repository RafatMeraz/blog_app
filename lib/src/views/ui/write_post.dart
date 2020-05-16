import 'dart:ui';

import 'package:blogapp/src/business_logic/view_models/write_post_viewmodel.dart';
import 'package:blogapp/src/views/utils/contraints.dart';
import 'package:blogapp/src/views/utils/reuseable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';

class WritePost extends StatelessWidget {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var writeNewBlogViewModel = Provider.of<WritePostViewModel>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HeaderWidget(
                title: 'Write Post',
              ),
              SizedBox(
                height: 10,
              ),
              SingleLineInputTextField(
                obscureText: false,
                labelText: 'Title',
                hintText: 'title',
                enable: true,
                dark: false,
                textEditingController: _titleController,
              ),
              SingleLineInputTextField(
                obscureText: false,
                labelText: 'Video URL(Optional)',
                hintText: 'url',
                enable: true,
                dark: false,
                textEditingController: _urlController,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        writeNewBlogViewModel.image == null ? 'No Image Selected' : basename(writeNewBlogViewModel.image.path)
                      ),
                    ),
                    OutlineButton(
                      child: Text('SELECT'),
                      onPressed: writeNewBlogViewModel.selectNewImage,
                      textColor: kDarkOrange,
                      borderSide: BorderSide(
                        color: kDarkOrange
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 300,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Theme(
                  data: ThemeData(
                    primaryColor: kDarkOrange,
                  ),
                  child: TextField(
                    selectionHeightStyle: BoxHeightStyle.max,
                    maxLines: 10000,
                    style: TextStyle(
                        color: kSoftBlack
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kSoftBlack),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: 'Write Post',
                      hintText: 'Write your post here',
                      alignLabelWithHint: true,
                      hintStyle: TextStyle(
                          color: Colors.black38
                      ),
                      labelStyle: TextStyle(
                          color: Colors.black54
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                    ),
                  ),
                ),
              ),
              RoundedRaisedButton(
                textColor: Colors.white,
                text: 'POST',
                onPress: (){},
                color: kDarkOrange,
              )
            ],
          ),
        ),
      ),
    );
  }
}
