import 'package:flutter/material.dart';
import 'package:simple_state_handling/models/dog.dart';
import 'package:simple_state_handling/services/api.dart';

enum LoadingStates { initial, loading, completed, error }

class DogNotifier with ChangeNotifier {
  final Api<Dog> _dogApi;
  DogNotifier(this._dogApi);

  LoadingStates _state = LoadingStates.initial;
  LoadingStates get state => _state;

  Dog _dog = Dog.initial();
  Dog get dog => _dog;

  void _updateState(LoadingStates state) {
    _state = state;
    notifyListeners();
  }

  Future<void> fetchDog() async {
    try {
      _updateState(LoadingStates.loading);
      _dog = await _dogApi.fetch();
      _updateState(LoadingStates.completed);
    } catch (e) {
      _updateState(LoadingStates.error);
    }
  }
}
