import 'package:app/presentation/controllers/user_controller.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FormController extends GetxController {
  RxBool visable = RxBool(false);
  RxString email = RxString('');
  RxString password = RxString('');
  RxnString emailErrorText = RxnString(null);
  RxnString passwordErrorText = RxnString(null);
  Rxn<Function()> submitFunc = Rxn<Function()>(null);

  final _passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  final _emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  void emailChanged(String value) {
    validateEmail(value);
    email.value = value;
  }

  void passwordChanged(String value) {
    validatePassword(value);
    password.value = value;
  }

  void validateEmail(String value) {
    emailErrorText.value = null;
    if (_emailRegex.hasMatch(value)) {
      validateForm();
    } else {
      emailErrorText.value = 'A complete, valid email e.g. joe@gmail.com';
    }
  }

  void validatePassword(String value) {
    passwordErrorText.value = null;
    if (_passwordRegex.hasMatch(value)) {
      validateForm();
    } else {
      passwordErrorText.value =
          'Password must be at least 8 characters and contain at least one letter and number';
    }
  }

  void validateForm() {
    submitFunc.value = null;
    if (emailErrorText.value == null && passwordErrorText.value == null) {
      submitFunc.value = submitFunction;
    }
  }

  void togglePasswordButton() {
    visable.value = !visable.value;
    update();
  }

  Future<void> Function() submitFunction() {
    return () async {
      UserController().login(email.value, password.value);
    };
  }
}
