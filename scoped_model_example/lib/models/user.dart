import 'package:scoped_model/scoped_model.dart';

class User extends Model{
  String _name = 'Robert Brunhage';

  String get name => _name;


  void changeName(String name){
    this._name = name;
    notifyListeners();
  }
}