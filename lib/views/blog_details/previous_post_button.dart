import 'package:bubba_days/views/blog_details/blog_details_stream.dart';
import 'package:flutter/material.dart';

class PreviousPostButton extends StatelessWidget {
  const PreviousPostButton(
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
                  MaterialPageRoute(
                    builder: (context) => BlogDetailsStream(index: index + 1),
                  ),
                );
              }
            : null,
        child: Text(
          'Previous Post',
          style: index != length - 1
              ? const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)
              : const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
