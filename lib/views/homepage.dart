import 'package:bubba_days/views/valentines.dart';
import 'package:bubba_days/widgets/homepage/homepage_stream.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color shade850 = const Color(0xFF303030);
  int currentIndex = 0;
  final List<Widget> navbarViews = [
    const HomePageStream(),
    const ValentinesView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navbarViews[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: shade850,
        selectedItemColor: const Color.fromARGB(255, 154, 140, 182),
        unselectedItemColor: Colors.grey[600],
        showUnselectedLabels: false,
        showSelectedLabels: true,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Love",
          ),
        ],
      ),
    );
  }
}
