import 'package:flutter/material.dart';

import 'thumbnail.dart';

class PostTileOpenContainer extends StatelessWidget {
  const PostTileOpenContainer({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.details,
    required this.thumbnail,
  }) : super(key: key);

  final String title, subtitle, details, thumbnail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Thumbnail(
            thumbnail: thumbnail,
          ),
          Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                    ),
                  ],
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
