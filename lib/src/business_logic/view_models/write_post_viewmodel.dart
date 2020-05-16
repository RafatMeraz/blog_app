import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class WritePostViewModel with ChangeNotifier{
  bool inProgress = false;
  File _image;

  File get image => this._image;

  postNewBlog(){

  }

  Future selectNewImage() async{
    try{
      _image = await ImagePicker.pickImage(source: ImageSource.gallery);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}