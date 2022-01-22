import 'package:flutter/material.dart';

class AboutMeView extends StatelessWidget {
  const AboutMeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Me',
        ),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
