import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/root_widget.dart';

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
    return GetMaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.fiber_new)),
                Tab(icon: Icon(Icons.bookmark)),
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
