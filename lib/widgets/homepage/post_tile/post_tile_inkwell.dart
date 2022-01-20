import 'package:bubba_days/views/details.dart';
import 'package:bubba_days/widgets/homepage/post_tile/thumbnail.dart';

import 'package:flutter/material.dart';

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
            builder: (context) => BlogDetailsView(index: index),
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
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey.shade50,
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
