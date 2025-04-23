import 'package:flutter/material.dart';
import '../controller/authcontroller/authcontroller.dart';

class LoginForm extends StatelessWidget {
  final AuthController controller;

  const LoginForm({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Email", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
        const SizedBox(height: 10),
        TextField(
          controller: controller.emailController,
          decoration: InputDecoration(
            hintText: "Email",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(height: 20),
        const Text("Password", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
        const SizedBox(height: 10),
        TextField(
          controller: controller.passwordController,
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
        const SizedBox(height: 60),
        Center(
          child: RichText(
            text: const TextSpan(
              text: 'Don’t have an account? ',
              style: TextStyle(fontSize: 14, color: Color(0xff32343D)),
              children: [
                TextSpan(
                  text: 'Sign up',
                  style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xff59C69F)),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
