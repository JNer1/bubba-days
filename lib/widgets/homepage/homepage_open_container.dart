import 'package:bubba_days/widgets/homepage/post_tile/post_tile_open_container.dart';
import 'package:flutter/material.dart';
import 'package:bubba_days/views/details.dart';

import 'package:animations/animations.dart';

class HomePageOpenContainer extends StatelessWidget {
  const HomePageOpenContainer(
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
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: OpenContainer(
        closedElevation: 1,
        transitionDuration: const Duration(milliseconds: 300),
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        closedColor: Colors.transparent,
        closedBuilder: (context, action) {
          return PostTileOpenContainer(
            title: title,
            subtitle: subtitle,
            details: details,
            thumbnail: thumbnail,
          );
        },
        openBuilder: (context, action) {
          return BlogDetailsView(
            index: index,
          );
        },
      ),
    );
  }
}
