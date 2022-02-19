import 'package:flutter/material.dart';

import 'login_email_text_form.dart';
import 'login_password_text_form.dart';

class LoginDetailsFields extends StatefulWidget {
  final TextEditingController emailController, passwordController;

  const LoginDetailsFields(
      {required this.emailController,
      required this.passwordController,
      Key? key})
      : super(key: key);

  @override
  _LoginDetailsFieldsState createState() => _LoginDetailsFieldsState();
}

class _LoginDetailsFieldsState extends State<LoginDetailsFields> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoginEmailTextForm(
            controller: widget.emailController,
          ),
          LoginPassowrdForm(
            controller: widget.passwordController,
          ),
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "Forgot password?",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
