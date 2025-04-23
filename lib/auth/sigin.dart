import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/authcontroller/authcontroller.dart';
import 'login_button.dart';
import 'login_form.dart';
import 'login_header.dart';


class LoginScreen extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginHeader(),
              const SizedBox(height: 40),
              Center(child: Image.asset("images/Group 1000007000.png", height: 80)),
              const SizedBox(height: 20),
              LoginForm(controller: controller),
              const SizedBox(height: 15),
              LoginButton(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
