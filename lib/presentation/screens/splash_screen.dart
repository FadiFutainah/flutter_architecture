import 'package:app/data/services/local_storage.dart';
import 'package:app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: FutureBuilder(
          future: LocalStorage().token,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == '') {
                Get.off(() => const LoginScreen());
              } else {
                Get.off(() => const HomeScreen());
              }
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
