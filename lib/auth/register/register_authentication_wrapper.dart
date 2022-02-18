import 'package:bubba_days/auth/register/register_page.dart';
import 'package:bubba_days/views/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterAuthenticationWrapper extends StatelessWidget {
  const RegisterAuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = Provider.of<User?>(context);

    if (firebaseUser != null) {
      return const HomePage();
    }
    if (firebaseUser == null) {
      return const RegisterPage();
    }

    return Container();
  }
}
