import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.arrow_back, size: 25),
        SizedBox(width: 10),
        Text("Sign In", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
