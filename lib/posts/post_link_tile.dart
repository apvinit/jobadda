import 'package:flutter/material.dart';
import 'package:jobadda/model/important_link.dart';
import 'package:url_launcher/url_launcher.dart';

class PostLinkTile extends StatelessWidget {
  final ImportantLink link;
  PostLinkTile(this.link);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: InkWell(
        splashColor: Theme.of(context).accentColor.withOpacity(0.1),
        highlightColor: Theme.of(context).accentColor.withOpacity(0.1),
        onTap: () => _launchURL(link.url),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            link.title,
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.blue[900],
                decoration: TextDecoration.underline),
          ),
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}
