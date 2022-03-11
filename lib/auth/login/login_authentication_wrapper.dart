import 'package:bubba_days/views/homepage/homepage.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';

class LoginAuthenticationWrapper extends StatelessWidget {
  const LoginAuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = Provider.of<User?>(context);

    if (firebaseUser != null) {
      return const HomePage();
    }
    if (firebaseUser == null) {
      return const LoginPage();
    }

    return Container();
  }
}
