import 'package:flutter/material.dart';
import 'package:fluttertask/data/network/HttpService.dart';
import 'package:fluttertask/data/network/models/StorySchema.dart';
import 'package:fluttertask/ui/TopStoriesViewModel.dart';
import 'StoryDetailPage.dart';

class TopStoriesPage extends StatefulWidget {
  const TopStoriesPage({Key key}) : super(key: key);

  @override
  _LatestNewsPage createState() => _LatestNewsPage();
}

class _LatestNewsPage extends State<TopStoriesPage>
    with AutomaticKeepAliveClientMixin<TopStoriesPage> {
  @override
  // to keep the tab alive (not refreshed after each swipe!)a
  bool get wantKeepAlive => true;

  final TopStoriesViewModel _topStoriesViewModel = TopStoriesViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: _topStoriesViewModel.getStories(),
        builder:
            (BuildContext context, AsyncSnapshot<List<StorySchema>> snapshot) {
          if (snapshot.hasData) {
            List<StorySchema> posts = snapshot.data;
            return ListView(
              children: posts
                  .map(
                    (StorySchema story) => ListTile(
                      title: Text(story.title),
                      subtitle: Text("${story.title}"),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => StoryDetailPage(
                            story: story,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

//class LatestNewsPage extends StatelessWidget {
//  final HttpService httpService = HttpService();
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(),
//      body: FutureBuilder(
//        future: httpService.getStories(),
//        builder:
//            (BuildContext context, AsyncSnapshot<List<StorySchema>> snapshot) {
//          if (snapshot.hasData) {
//            List<StorySchema> posts = snapshot.data;
//            return ListView(
//              children: posts
//                  .map(
//                    (StorySchema story) => ListTile(
//                      title: Text(story.title),
//                      subtitle: Text("${story.title}"),
//                      onTap: () => Navigator.of(context).push(
//                        MaterialPageRoute(
//                          builder: (context) => StoryDetailPage(
//                            story: story,
//                          ),
//                        ),
//                      ),
//                    ),
//                  )
//                  .toList(),
//            );
//          } else {
//            return Center(child: CircularProgressIndicator());
//          }
//        },
//      ),
//    );
//  }
//}
