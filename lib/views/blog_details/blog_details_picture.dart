import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BlogDetailsPicture extends StatelessWidget {
  const BlogDetailsPicture({Key? key, required this.imgUrl}) : super(key: key);
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      width: 380,
      height: 300,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            color: Colors.orange,
          ),
          imageUrl: imgUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
