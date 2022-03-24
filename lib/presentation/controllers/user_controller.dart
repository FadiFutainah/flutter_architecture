import 'package:app/application/config/config.dart';
import 'package:app/data/repositories/user_repo.dart';
import 'package:app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class UserController extends GetxController with StateMixin<String> {
  void login(String email, String password) async {
    change(null, status: RxStatus.loading());
    final response = await UserRepository()
        .login(UserModel(email: email, password: password));

    if (response == Message.loginSuccess) {
      change(response, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error(response));
    }
    Get.showSnackbar(GetSnackBar(titleText: Text(response)));
  }
}
