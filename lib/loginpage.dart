import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bubba Days'),
      ),
      body: Center(
        child: FloatingActionButton.extended(
          onPressed: () {
            GoogleSignIn().signIn();
          },
          label: const Text('Sign in with Google'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
        ),
      ),
    );
  }
}
