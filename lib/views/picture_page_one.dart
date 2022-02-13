import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class PicturePageOne extends StatefulWidget {
  const PicturePageOne({Key? key}) : super(key: key);

  @override
  State<PicturePageOne> createState() => _PicturePageOneState();
}

class _PicturePageOneState extends State<PicturePageOne> {
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
          child: Text(
            'Always remember...',
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              textStyle: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
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
              child: Image.asset(
                './assets/lab_pic.jpg',
                width: double.infinity,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
