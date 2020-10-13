import 'package:flutter/material.dart';
import 'package:fluttertask/data/models/StorySchema.dart';

//import 'package:fluttertask/data/network/models/StorySchema.dart';
import 'package:fluttertask/ui/TopStoriesViewModel.dart';
import 'package:fluttertask/utils/utils.dart';
import 'package:get/route_manager.dart';
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
      body: FutureBuilder(
        future: _topStoriesViewModel.getStories(),
        builder:
            (BuildContext context, AsyncSnapshot<List<StorySchema>> snapshot) {
          if (snapshot.hasData) {
            List<StorySchema> stories = snapshot.data;
            return ListView(
              children: stories
                  .map(
                    (StorySchema story) => _createListTile(story),
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

  void _navigate(StorySchema story) {
    //NOTE: Here, I used the GetX Library , it's light and simple ,
    // it abstracts sevceral lines of code to navigate between widgets!
    Get.to(StoryDetailPage(
      story: story,
    ));
  }

  Widget _createListTile(StorySchema story) {
    // create list item (tile) for each story object!
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        borderOnForeground: true,
        elevation: 1,
        shadowColor: Colors.grey,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ListTile(
              leading: CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage("${story?.multimedia[0]?.url}"),
                backgroundColor: Colors.grey.shade800,
              ),
              title: Text(story.title),
              subtitle: Text(story.publishedDate),

//            Text(Utils().getFormattedDate(story.publishedDate).toString()),

              onTap: () => _navigate(story)),
        ),
      ),
    );
  }
}
