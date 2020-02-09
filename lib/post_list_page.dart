import 'package:flutter/material.dart';
import 'package:jobadda/model/post.dart';
import 'package:jobadda/post_item_tile.dart';
import 'package:jobadda/services/database.dart';

class PostListPage extends StatelessWidget {
  @required
  final String title;

  PostListPage({this.title});

  @override
  Widget build(BuildContext context) {
    var db = Database();
    var future;
    switch (title) {
      case 'Results':
        future = db.getResults();
        break;
      case 'Admit Cards':
        future = db.getAdmitCards();
        break;
      case 'Latest Jobs':
        future = db.getLatestJobs();
        break;
      case 'Answer Keys':
        future = db.getAnswerKeys();
        break;
      case 'Admissions':
        future = db.getAdmissions();
        break;
      case 'Syllabus':
        future = db.getSyllabus();
        break;
    }

    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: FutureBuilder(
          future: future,
          builder: (context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.hasData) {
              var posts = snapshot.data;
              return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return PostItemTile(post: posts[index]);
                  });
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}
