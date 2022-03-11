import 'package:bubba_days/views/blog_details/blog_details_stream.dart';
import 'package:flutter/material.dart';

class PreviousPostButtonSlide extends StatelessWidget {
  const PreviousPostButtonSlide(
      {Key? key, required this.index, required this.length})
      : super(key: key);

  final int index, length;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        // style: OutlinedButton.styleFrom(
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(8),
        //   ),
        // ),
        onPressed: index != length - 1
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
                            begin: const Offset(-1, 0),
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
                        return BlogDetailsStream(index: index + 1);
                      }),
                );
              }
            : null,
        child: Text(
          'Previous Post',
          style: index != length - 1
              ? const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)
              : const TextStyle(
                  color: Colors.white54, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
