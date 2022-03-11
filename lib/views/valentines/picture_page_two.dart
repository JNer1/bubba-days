import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class PicturePageTwo extends StatefulWidget {
  const PicturePageTwo({Key? key}) : super(key: key);

  @override
  State<PicturePageTwo> createState() => _PicturePageTwoState();
}

class _PicturePageTwoState extends State<PicturePageTwo> {
  double padding = 125;
  double opacity = 0;

  @override
  void initState() {
    super.initState();
    // Rebuild the screen after 3s which will process the animation from green to blue
    Future.delayed(const Duration(milliseconds: 0))
        .then((value) => setState(() {
              padding = 95;
              opacity = 1;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AnimatedPadding(
          padding: EdgeInsets.only(bottom: padding),
          curve: Curves.easeInOutCubic,
          duration: const Duration(milliseconds: 800),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              FadeAnimatedText(
                'You are my love',
                duration: const Duration(milliseconds: 2500),
                textStyle: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                      fontSize: 45, fontWeight: FontWeight.bold),
                ),
              ),
              FadeAnimatedText(
                'You are amazing',
                duration: const Duration(milliseconds: 2500),
                textStyle: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                      fontSize: 45, fontWeight: FontWeight.bold),
                ),
              ),
              FadeAnimatedText(
                'You are enough',
                duration: const Duration(milliseconds: 2500),
                textStyle: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                      fontSize: 45, fontWeight: FontWeight.bold),
                ),
              ),
            ],
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
              child: Image.asset(
                './assets/bubba.jpeg',
                width: double.infinity,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
