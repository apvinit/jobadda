import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:jobadda/categories/category_page.dart';
import 'package:jobadda/main.dart';

import 'home/home_post_list.dart';
import 'posts/post_detail_page.dart';
import 'search/search_delegate.dart';

class BottomNavPage extends StatefulWidget {
  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _selectedIndex = 0;
  final postDelegate = PostSearchDelegate();

  static final homePostList = HomePostList();
  static final categoryPage = CatergoyPage();

  List<Widget> _widgetOptions = <Widget>[
    homePostList,
    categoryPage,
  ];

  @override
  void initState() {
    super.initState();
    initDynamicLinks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex != 2 ? AppBar(title: Text('Job Adda')) : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), title: Text('Categories')),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text('Search')),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }

  void _onItemTapped(int index) async {
    if (index == 2) {
      await showSearch(context: context, delegate: postDelegate);
      return;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  void initDynamicLinks() async {
    final data = await FirebaseDynamicLinks.instance.getInitialLink();
    final deepLink = data?.link;

    if (deepLink != null) {
      final postId = deepLink.path.substring(1, deepLink.path.length);
      navigatorKey.currentState.push(
        MaterialPageRoute(
          builder: (_) => PostDetailPage(id: postId),
        ),
      );
    }

    FirebaseDynamicLinks.instance.onLink(onSuccess: (dynamicLink) async {
      final deepLink = dynamicLink?.link;

      if (deepLink != null) {
        final postId = deepLink.path.substring(1, deepLink.path.length);
        navigatorKey.currentState.push(
          MaterialPageRoute(
            builder: (_) => PostDetailPage(id: postId),
          ),
        );
      }
    }, onError: (e) async {
      print(e.message);
    });
  }
}
