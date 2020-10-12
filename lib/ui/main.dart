import 'package:flutter/material.dart';

import 'BookmarksPage.dart';
import 'TopStoriesPage.dart';
import '../assets/Strings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Widget> bodyWidgets = [
    TopStoriesPage(),
    BookmarksPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
              ],
            ),
            title: Text(Strings.latestNews),
          ),
          body: TabBarView(
            children: [
              bodyWidgets[0],
              bodyWidgets[1],
            ],
          ),
        ),
      ),
    );
  }
}
