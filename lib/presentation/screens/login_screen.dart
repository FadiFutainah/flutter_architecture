import 'package:app/presentation/controllers/user_controller.dart';
import 'package:app/presentation/widgets/form_field.dart';
import 'package:app/presentation/widgets/password_field.dart';
import 'package:app/presentation/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: userController.obx(
        (loginState) {
          return Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                LoginFormField(label: 'username'),
                SizedBox(height: 10),
                PasswordFormField(),
                SizedBox(height: 30),
                SumbitButton(),
              ],
            ),
          );
        },
        onLoading: const CircularProgressIndicator(),
      ),
    );
  }
}
