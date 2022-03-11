import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeartPage extends StatefulWidget {
  const HeartPage({Key? key}) : super(key: key);

  @override
  State<HeartPage> createState() => _HeartPageState();
}

class _HeartPageState extends State<HeartPage> with TickerProviderStateMixin {
  double? position = 60;
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Rebuild the screen after 3s which will process the animation from green to blue
    Future.delayed(const Duration(milliseconds: 0))
        .then((value) => setState(() {
              position = 90;
              opacity = 1;
            }));
  }

  late final AnimationController _hoverAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  )..repeat(reverse: true);

  late final Animation<Offset> _hoverAnimation = Tween(
    begin: Offset.zero,
    end: const Offset(0, 0.1),
  ).animate(CurvedAnimation(
      parent: _hoverAnimationController, curve: Curves.easeInOut));

  @override
  void dispose() {
    _hoverAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AnimatedPositioned(
          top: position,
          curve: Curves.easeInOutBack,
          duration: const Duration(milliseconds: 0, seconds: 1),
          child: Text(
            'Hewwo My Love',
            style: GoogleFonts.nunito(
                textStyle:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          ),
        ),
        Positioned(
          bottom: 0,
          right: -30,
          child: AnimatedOpacity(
            opacity: opacity,
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOutCubic,
            child: Image.asset(
              './assets/mochi_and_peach.png',
              height: 380,
            ),
          ),
        ),
        Positioned(
          bottom: 380,
          child: SlideTransition(
              position: _hoverAnimation,
              child: AnimatedOpacity(
                opacity: opacity,
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOutCubic,
                child: const Icon(
                  Icons.favorite,
                  color: Color.fromARGB(255, 118, 95, 158),
                  size: 100,
                ),
              )),
        ),
      ],
    );
  }
}
