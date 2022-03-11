import 'package:bubba_days/views/blog_details/blog_details_stream.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: index != 0
            ? () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlogDetailsStream(index: index - 1),
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
                  color: Colors.grey, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
