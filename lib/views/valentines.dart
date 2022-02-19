import 'package:bubba_days/views/picture_page_two.dart';
import 'package:bubba_days/views/type_page.dart';
import 'package:flutter/material.dart';
import 'heart_page.dart';
import 'picture_page_one.dart';

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
