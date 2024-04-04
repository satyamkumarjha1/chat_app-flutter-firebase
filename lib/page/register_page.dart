// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/auth/auth_service.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/Components/my_button.dart';
import 'package:chat_app/Components/text_field.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;

  RegisterPage({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _passwordcontroller = TextEditingController();

  final TextEditingController _confrimpasswordcontroller =
      TextEditingController();

  void register(BuildContext context) {
    final _auth = AuthService();

    if (_passwordcontroller.text == _confrimpasswordcontroller.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailcontroller.text, _passwordcontroller.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
        
          context: context,
          builder: (context) => AlertDialog(
                title: Text("password doesnot match !"),
              ),
              );
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
              "Create a new account ",
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
              hintText: "Password",
              controller: _passwordcontroller,
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField(
              obscureText: true,
              hintText: "Confrim password",
              controller: _confrimpasswordcontroller,
            ),
            SizedBox(
              height: 20,
            ),
            MyButton(
              text: "Register",
              onTap: () => register(context),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an Account ? "),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Log In ",
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
