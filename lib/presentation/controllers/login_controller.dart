import 'package:app/application/config/config.dart';
import 'package:app/data/repositories/user_repo.dart';
import 'package:app/models/user_model.dart';
import 'package:app/presentation/screens/home_screen.dart';
import 'package:app/presentation/screens/login_screen.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class UserController extends GetxController with StateMixin<String> {
  void login(String email, String password) async {
    change(null, status: RxStatus.loading());
    final response = await UserRepository()
        .login(UserModel(email: email, password: password));

    if (response == Message.loginSuccess) {
      Get.off(() => const HomeScreen());
      change(response, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error(response));
    }
    Get.showSnackbar(
        GetSnackBar(message: response, duration: const Duration(seconds: 3)));
  }

  void logout() async {
    await UserRepository().logout();
    Get.off(() => const LoginScreen());
    Get.showSnackbar(const GetSnackBar(
        message: Message.loginSuccess, duration: Duration(seconds: 3)));
  }
}
