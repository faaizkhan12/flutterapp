import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/authcontroller/authcontroller.dart';

class LoginButton extends StatelessWidget {
  final AuthController controller;

  const LoginButton({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => GestureDetector(
        onTap: controller.login,
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [Color(0xFF5ACD84), Color(0xFF56AEFF)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Center(
            child: controller.isLoading.value
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text(
              'Log In',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
