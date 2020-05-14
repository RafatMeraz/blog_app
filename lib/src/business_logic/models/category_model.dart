class CategoryModel {
  List<_Category> _categories = List<_Category>();

  CategoryModel.fromJson(var jsonResponse){
    for(int i=0; i<jsonResponse.length; i++){
      _Category _category = _Category(jsonResponse[i]);
      _categories.add(_category);
    }
  }

  List<_Category> get categoryList => this._categories;
}

class _Category {
  int _id;
  String _name;

  _Category(var jsonCategory){
    this._id = jsonCategory['id'];
    this._name = jsonCategory['name'];
  }

  int get id => this._id;
  String get name => this._name;
}