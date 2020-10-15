import 'package:flutter/material.dart';
import 'package:fluttertask/data/localdb/database.dart';
import 'package:fluttertask/ui/BookmarksViewModel.dart';
import 'package:get/get_navigation/src/root/root_widget.dart';

import 'BookmarksPage.dart';
import 'StoryDetailPageViewModel.dart';
import 'TopStoriesPage.dart';
import '../assets/Strings.dart';
import 'TopStoriesViewModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db')
      .build();

  final TopStoriesViewModel _topStoriesViewModel = TopStoriesViewModel();
  final StoryDetailPageViewModel _storyDetailPageViewModel = StoryDetailPageViewModel(
      database);
  final BookmarksViewModel _bookmarksViewModels = BookmarksViewModel(database);


  runApp(MyApp(
      _topStoriesViewModel, _storyDetailPageViewModel, _bookmarksViewModels));
}

class MyApp extends StatelessWidget {
  TopStoriesViewModel topStoriesViewModel;
  StoryDetailPageViewModel storyDetailPageViewModel;
  BookmarksViewModel bookmarksViewModel;
  List<Widget> bodyWidgets = [];

  MyApp(this.topStoriesViewModel, this.storyDetailPageViewModel,
      this.bookmarksViewModel) {
    bodyWidgets = [
      TopStoriesPage(storyDetailPageViewModel,topStoriesViewModel),
      BookmarksPage(storyDetailPageViewModel, bookmarksViewModel),
    ];
  }

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
