import 'package:flutter/material.dart';
import 'package:jobadda/model/post.dart';

class PostInfo extends StatelessWidget {
  @required
  final Post post;

  PostInfo({this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('Post', style: TextStyle(color: Colors.blue)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              post.title,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Posted On', style: TextStyle(color: Colors.blue)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        post.createdDate.toDate().toString(),
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Updated On', style: TextStyle(color: Colors.blue)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        post.updatedDate.toDate().toString(),
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text('Organisation', style: TextStyle(color: Colors.blue)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              post.organisation,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Text('Short Info', style: TextStyle(color: Colors.blue)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              post.info,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}
