import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/my_button.dart';
import 'package:flutter_project/widgets/my_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50),
            Icon(
              Icons.lock,
              size: 100,
              color: Colors.teal,
            ),
            SizedBox(height: 50),
            Text(
              "Welcome Back you've been missed",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 24),
            MyTextField(
              hintText: "Email",
              obscureText: false,
              controller: emailController,
            ),
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: passwordController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text("Forget Password"),
                ),
              ],
            ),
            MyButton(
              text: "Login",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
