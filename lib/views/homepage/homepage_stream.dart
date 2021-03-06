import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../../auth/authentication_service.dart';
import 'homepage_open_container.dart';

class HomePageStream extends StatefulWidget {
  const HomePageStream({Key? key}) : super(key: key);

  @override
  State<HomePageStream> createState() => _HomePageStreamState();
}

class _HomePageStreamState extends State<HomePageStream> {
  final Stream<QuerySnapshot> _homepageStream = FirebaseFirestore.instance
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
        return CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: const Text('Bubba Days'),
              centerTitle: true,
              forceElevated: true,
              elevation: 3,
              floating: true,
              snap: true,
              actions: [
                IconButton(
                    onPressed: () {
                      showLogout(context);
                    },
                    icon: const Icon(Icons.logout))
              ],
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
        );
      },
    );
  }

  Future<dynamic> showLogout(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Log out?'),
        actions: [
          TextButton(onPressed: logOut, child: const Text('Yes')),
          TextButton(
              onPressed: Navigator.of(context).pop, child: const Text('No'))
        ],
      ),
    );
  }

  void logOut() {
    context.read<AuthenticationService>().logout();
    Navigator.of(context).pop();
  }
}
