import 'dart:async';

import 'package:bloc_pattern_tutorial/models/user.dart';
import 'package:bloc_pattern_tutorial/widgets/bloc_provider.dart';
import 'package:bloc_pattern_tutorial/api/db_api.dart';

class UserBloc implements BlocBase {
  User _user;

  // Streams to handle the user
  StreamController<User> _userController = StreamController<User>.broadcast();
  Sink<User> get _inUser => _userController.sink;
  Stream<User> get outUser => _userController.stream;

  UserBloc() {
    init();
  }

  void init() async {
    _user = await api.getUser();
    _inUser.add(_user);
  }

  @override
  void dispose() {
    _userController.close();
  }

  void updateUser(User user) {
    _user = user;
    _inUser.add(_user);
  }

  void updateName(String name) {
    _user.name = name;
    _inUser.add(_user);
  }
}
