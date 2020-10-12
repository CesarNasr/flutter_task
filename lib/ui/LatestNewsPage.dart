import 'package:flutter/material.dart';
import 'package:fluttertask/data/network/HttpService.dart';
import 'package:fluttertask/data/network/models/StorySchema.dart';
import 'StoryDetailPage.dart';

class LatestNewsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: FutureBuilder(
        future: httpService.getStories(),
        builder: (BuildContext context, AsyncSnapshot<List<StorySchema>> snapshot) {
          if (snapshot.hasData) {
            List<StorySchema> posts = snapshot.data;
            return ListView(
              children: posts.map(
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