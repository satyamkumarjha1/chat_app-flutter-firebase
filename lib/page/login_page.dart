// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/auth/auth_service.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/Components/my_button.dart';
import 'package:chat_app/Components/text_field.dart';

class LoginPage extends StatelessWidget {
  final void Function()? onTap;

  LoginPage({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _passwordcontroller = TextEditingController();

  void login(BuildContext context) async {
    final authServise = AuthService();

    try {
      await authServise.signInWithEmailPassword(
        _emailcontroller.text,
        _passwordcontroller.text,
      );
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              color: Theme.of(context).colorScheme.primary,
              size: 60,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome back",
              style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField(
              obscureText: false,
              hintText: "Email",
              controller: _emailcontroller,
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField(
              obscureText: true,
              hintText: "password",
              controller: _passwordcontroller,
            ),
            SizedBox(
              height: 20,
            ),
            MyButton(
              text: "Login",
              onTap: () => login(context),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member ?  "),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register Now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
