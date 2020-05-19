
import 'package:blogapp/src/business_logic/models/favourite_model.dart';
import 'package:blogapp/src/services/web_services/blog_api_services.dart';

class FavouriteViewModel{
  BlogApiServices _blogApiServices = BlogApiServices();
  List<Favourite> _favourites = List();
  bool _inProgress = false;

  bool get inProgress => this._inProgress;
  List<Favourite> get favourites => this._favourites;

  getAllFavourites()async{
    _inProgress = true;
    var _response = await _blogApiServices.getAllFavouritesBlog();
    print(_response);
    for (int i=0; i<_response.length; i++){
      _favourites.add(Favourite.fromJson(_response[i]));
    }
    _inProgress = false;
  }

}