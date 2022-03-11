import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'blog_details_picture.dart';
import 'next_post_button.dart';
import 'previous_post_button.dart';

class BlogDetails extends StatelessWidget {
  const BlogDetails(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.details,
      required this.imgUrl,
      required this.index,
      required this.length})
      : super(key: key);

  final String title, subtitle, details, imgUrl;
  final int index, length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PreviousPostButton(
                  index: index,
                  length: length,
                ),
                NextButton(index: index),
              ],
            ),
          ),
          BlogDetailsPicture(imgUrl: imgUrl),
          Container(
            margin: const EdgeInsets.only(bottom: 40),
            child: Text(
              '"$subtitle"',
              style: GoogleFonts.notoSerif(
                textStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 26,
                  color: Colors.grey.shade400,
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 13, right: 8),
            child: Text(
              details.replaceAll('\\n', '\n'),
              style: const TextStyle(
                fontSize: 16,
                height: 1.75,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
