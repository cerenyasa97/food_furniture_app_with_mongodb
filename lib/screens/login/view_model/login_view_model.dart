import 'package:flutter/cupertino.dart';
import 'package:food_furniture_app/core/base/base_view_model.dart';
import 'package:food_furniture_app/core/enum/view_model_state.dart';
import 'package:food_furniture_app/core/helper/mongo_helper.dart';
import 'package:food_furniture_app/core/mixin/validation.dart';
import 'package:food_furniture_app/core/navigation/navigation.dart';
import 'package:food_furniture_app/core/widgets/dialog/alert_dialog.dart';
import 'package:food_furniture_app/route/route.dart';
import 'package:food_furniture_app/screens/login/model/user.dart';

class LoginViewModel extends BaseViewModel with Validation {
  final mongoHelper = MongoHelper.instance;
  final navigator = NavigationService.instance;
  final loginFormKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  Future<void> init() async {}

  void login() async {
    try {
      if (loginFormKey.currentState != null &&
          loginFormKey.currentState!.validate()) {
        state = ViewModelState.loading;
        loginFormKey.currentState!.save();
        final isLogin =
            await mongoHelper.login(User(email: email, password: password));
        if (isLogin)
          navigator.navigateTo(AppRoute.home);
        else {
          showAlertDialog(
              title: 'Error',
              content: 'Email or password is wrong',
              isShowOnlyConfirmButton: true);
        }
      }
    } on Exception catch (e) {
      showAlertDialog(
          title: 'Error',
          content: 'Error occured logged in',
          isShowOnlyConfirmButton: true);
    } finally {
      state = ViewModelState.loaded;
    }
  }
}
