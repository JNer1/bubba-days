import 'package:bubba_days/views/details.dart';
import 'package:flutter/material.dart';

class NextButtonSlide extends StatelessWidget {
  const NextButtonSlide({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        // style: OutlinedButton.styleFrom(
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(8),
        //   ),
        // ),
        onPressed: index != 0
            ? () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 280),
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secanimation,
                        Widget child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(1, 0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      );
                    },
                    pageBuilder: (
                      BuildContext context,
                      Animation<double> animation,
                      Animation<double> secanimation,
                    ) {
                      return BlogDetailsView(index: index - 1);
                    },
                  ),
                );
              }
            : null,
        child: Text(
          'Next Post',
          style: index != 0
              ? const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)
              : const TextStyle(
                  color: Colors.white54, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
