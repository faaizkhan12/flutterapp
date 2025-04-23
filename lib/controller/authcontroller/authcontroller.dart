import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../Routes/app_pages.dart';

class AuthController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final isLoading = false.obs;

  final String baseUrl = "https://api.mr-corp.ca/api/";

  void login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    const deviceId = "dcndjc89";

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Email and Password are required");
      return;
    }

    isLoading.value = true;

    final response = await http.post(
      Uri.parse("${baseUrl}login/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
        "device_id": deviceId,
      }),
    );

    isLoading.value = false;

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      Get.offAllNamed(Routes.HOME);
    } else {
      final error = jsonDecode(response.body);
      Get.snackbar("Login Failed", error["message"] ?? "Unknown error");
    }
  }
}
