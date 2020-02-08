import 'package:flutter/material.dart';

class PostLinkTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Download this thing',
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.blue,
                decoration: TextDecoration.underline),
          ),
        ),
      ),
    );
  }
}
