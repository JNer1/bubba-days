import 'package:bubba_days/views/blog_details/blog_details_stream.dart';
import 'package:flutter/material.dart';

import 'thumbnail.dart';

class PostTileInkWell extends StatelessWidget {
  const PostTileInkWell(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.details,
      required this.thumbnail,
      required this.index})
      : super(key: key);

  final String title, subtitle, details, thumbnail;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogDetailsStream(index: index),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Thumbnail(
            thumbnail: thumbnail,
          ),
          Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade300,
                ),
                textAlign: TextAlign.center,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          )
        ],
      ),
    );
  }
}
