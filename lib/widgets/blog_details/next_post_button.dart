import 'package:bubba_days/views/details.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key, required this.index}) : super(key: key);

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
                    MaterialPageRoute(
                      builder: (context) => BlogDetailsView(index: index - 1),
                    ));
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
