import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class TypePage extends StatefulWidget {
  const TypePage({Key? key}) : super(key: key);

  @override
  State<TypePage> createState() => _TypePageState();
}

class _TypePageState extends State<TypePage> {
  double bottomPadding = 30;
  double opacity = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0))
        .then((value) => setState(() {
              bottomPadding = 80;
              opacity = 1;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: AnimatedPadding(
            padding: EdgeInsets.fromLTRB(8, 80, 8, bottomPadding),
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOutCubic,
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TypewriterAnimatedText(
                  'I love you so much my Kath',
                  speed: const Duration(milliseconds: 90),
                  textAlign: TextAlign.center,
                  textStyle: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                        fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 40),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AnimatedOpacity(
                  opacity: opacity,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOutCubic,
                  child: Image.asset('./assets/christmas.jpg'))),
        )
      ],
    );
  }
}
