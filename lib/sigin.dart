import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'navigationbar/navigationbar.dart';

class SigIn extends StatefulWidget {
  const SigIn({Key? key}) : super(key: key);

  @override
  State<SigIn> createState() => _SigInState();
}

class _SigInState extends State<SigIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  final String baseUrl = "https://api.mr-corp.ca/api/";

  void login() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    const String deviceId = "dcndjc89";

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Email and Password are required");
      return;
    }

    setState(() {
      isLoading = true;
    });

    final url = Uri.parse("${baseUrl}login/");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
        "device_id": deviceId,
      }),
    );

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      Get.offAll(() => MainPage());
    } else {
      final error = jsonDecode(response.body);
      Get.snackbar("Login Failed", error["message"] ?? "Unknown error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.arrow_back, size: 25),
                  SizedBox(width: 10),
                  Text("Sign In", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(height: 40),
              Center(child: Image.asset("images/Group 1000007000.png", height: 80)),
              const SizedBox(height: 20),
              const Text("Email", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
              const SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 20),
              const Text("Password", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot password?", style: TextStyle(fontSize: 12, color: Color(0xff56B3EB))),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Checkbox(value: true, onChanged: (val) {}),
                  const Text("I agree with the terms and condition", style: TextStyle(fontSize: 12)),
                ],
              ),
              const SizedBox(height: 15),
              const SizedBox(height: 60),
              Center(
                child: RichText(
                  text: const TextSpan(
                    text: 'Don’t have an account? ',
                    style: TextStyle(fontSize: 14, color: Color(0xff32343D)),
                    children: [
                      TextSpan(text: 'Sign up', style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xff59C69F))),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Center(
                child: GestureDetector(
                  onTap: login,
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
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                        'Log In',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
