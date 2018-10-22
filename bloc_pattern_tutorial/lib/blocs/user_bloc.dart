import 'dart:async';

import 'package:bloc_pattern_tutorial/models/user.dart';
import 'package:bloc_pattern_tutorial/widgets/bloc_provider.dart';
import 'package:bloc_pattern_tutorial/api/db_api.dart';

class UserBloc implements BlocBase{
  User _user;

  // Streams to handle the user
  StreamController<User> _userController = StreamController<User>.broadcast();
  Sink<User> get _inUser => _userController.sink;
  Stream<User> get outUser => _userController.stream;

  // Streams to handle the action on the user
  StreamController<User> _updateUserController = StreamController();
  Sink<User> get updateUser => _updateUserController.sink;

  // Streams to handle the input of a new name
  StreamController<String> _updateNameController = StreamController();
  Sink<String> get updateName => _updateNameController.sink;

  UserBloc(){
    api.getUser().then((user){
      _user = user;
      _inUser.add(_user);
    });
    _updateUserController.stream.listen(_updateUser);
    _updateNameController.stream.listen(_updateName);
  }

  @override
  void dispose() {
    _userController.close();
    _updateUserController.close();
    _updateNameController.close();
  }

  void _updateUser(User user){
    _user = user;
    _inUser.add(_user);
  }

  void _updateName(String name){
    _user.name = name;
    _inUser.add(_user);
  }
}