import 'package:flutter/cupertino.dart';
import 'package:food_furniture_app/core/enum/view_model_state.dart';

abstract class BaseViewModel extends ChangeNotifier{
  var _state = ViewModelState.idle;
  var _initialStateCompleted = false;

  BaseViewModel(){
    if (!initialStateCompleted) {
      _init();
    }
  }

  Future<void> _init() async {
    state = ViewModelState.loading;
    await init();
    state = ViewModelState.loaded;
    initialStateCompleted = true;
  }

  Future<void> init() async {}

  get initialStateCompleted => _initialStateCompleted;

  set initialStateCompleted(value) {
    _initialStateCompleted = value;
    notifyListeners();
  }

  get state => _state;

  set state(value) {
    _state = value;
    notifyListeners();
  }
}