import 'package:flutter/material.dart';

import 'heart_page.dart';
import 'picture_page_one.dart';
import 'picture_page_two.dart';
import 'type_page.dart';

class ValentinesView extends StatefulWidget {
  const ValentinesView({Key? key}) : super(key: key);

  @override
  State<ValentinesView> createState() => _ValentinesViewState();
}

class _ValentinesViewState extends State<ValentinesView>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();

    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: pageController,
        children: const [
          HeartPage(),
          PicturePageOne(),
          PicturePageTwo(),
          TypePage()
        ],
      ),
    );
  }
}
