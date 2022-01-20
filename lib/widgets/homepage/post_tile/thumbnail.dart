import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Thumbnail extends StatelessWidget {
  const Thumbnail({
    Key? key,
    required this.thumbnail,
  }) : super(key: key);
  final String thumbnail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CachedNetworkImage(
        imageUrl: thumbnail,
        fit: BoxFit.cover,
      ),
    );
  }
}
