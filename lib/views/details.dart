import 'package:bubba_days/widgets/blog_details/blog_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BlogDetailsView extends StatelessWidget {
  BlogDetailsView({Key? key, required this.index}) : super(key: key);
  final int index;

  final Stream<QuerySnapshot> _detailsStream = FirebaseFirestore.instance
      .collection('blogs')
      .orderBy('order', descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _detailsStream,
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          var doc = snapshot.data.docs[index];
          return BlogDetails(
            title: doc.get('title'),
            subtitle: doc.get('subtitle'),
            details: doc.get('details'),
            imgUrl: doc.get('imgUrl'),
            index: index,
            length: snapshot.data.docs.length,
          );
        });
  }
}
