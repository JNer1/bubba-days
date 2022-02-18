import 'package:bubba_days/widgets/homepage/homepage_open_container.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageStream extends StatefulWidget {
  const HomePageStream({Key? key}) : super(key: key);

  @override
  State<HomePageStream> createState() => _HomePageStreamState();
}

class _HomePageStreamState extends State<HomePageStream> {
  Stream<QuerySnapshot> _homepageStream = FirebaseFirestore.instance
      .collection('blogs')
      .orderBy('order', descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _homepageStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Column(
            children: const [
              Icon(
                Icons.error,
                color: Colors.orange,
              ),
              Text('Error')
            ],
          );
        }
        return RefreshIndicator(
          onRefresh: () async {
            _refreshStream();
          },
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                title: const Text('Bubba Days'),
                centerTitle: true,
                titleTextStyle: GoogleFonts.workSans(
                    fontWeight: FontWeight.w600, fontSize: 20),
                forceElevated: true,
                elevation: 3,
                floating: true,
                snap: true,
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    var doc = snapshot.data.docs[index];
                    return HomePageOpenContainer(
                        title: doc['title'],
                        subtitle: doc['subtitle'],
                        details: doc['details'],
                        thumbnail: doc['thumbnail'],
                        index: index);
                  }, childCount: snapshot.data.docs.length),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _refreshStream() {
    setState(() {
      _homepageStream = FirebaseFirestore.instance
          .collection('blogs')
          .orderBy('order', descending: true)
          .snapshots();
    });
  }
}
