import 'dart:ui';

import 'package:blogapp/src/business_logic/view_models/write_post_viewmodel.dart';
import 'package:blogapp/src/views/utils/contraints.dart';
import 'package:blogapp/src/views/utils/reuseable_widgets.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';

class WritePost extends StatefulWidget {
  @override
  _WritePostState createState() => _WritePostState();
}

class _WritePostState extends State<WritePost> {
  TextEditingController _titleController, _urlController, _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _urlController = TextEditingController();
    _contentController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _urlController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var writeNewBlogViewModel = Provider.of<WritePostViewModel>(context);

    return ModalProgressHUD(
      inAsyncCall: writeNewBlogViewModel.inProgress,
      child: Scaffold(
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
                          writeNewBlogViewModel.image == null ? 'No Image Selected' : basename(writeNewBlogViewModel.image.path.split("/").last)
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
                      controller: _contentController,
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
                  onPress: () async{
                    if (_titleController.text.trim().isNotEmpty){
                      if (_contentController.text.trim().isNotEmpty){
                        var result = await writeNewBlogViewModel.postNewBlog(
                            _titleController.text.trim(),
                            _contentController.text.trim(),
                            _urlController.text.trim()
                        );
                        if (result){
                          _titleController.clear();
                          _urlController.clear();
                          _contentController.clear();
                          writeNewBlogViewModel.clearImage();
                          _urlController.clear();
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                  writeNewBlogViewModel.status,
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                                backgroundColor: Colors.green
                            )
                          );
                        } else {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                    writeNewBlogViewModel.status,
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  ),
                                  backgroundColor: Colors.red
                              )
                          );
                        }
                      } else {
                        BotToast.showText(
                            text: 'Please enter title.',
                            contentColor: Colors.red,
                            textStyle: TextStyle(
                                color: Colors.white
                            )
                        );
                      }
                    } else {
                      BotToast.showText(
                        text: 'Please enter title.',
                        contentColor: Colors.red,
                        textStyle: TextStyle(
                          color: Colors.white
                        )
                      );
                    }
                  },
                  color: kDarkOrange,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
