import 'package:flutter/material.dart';
import 'package:fluttertask/data/network/models/StorySchema.dart';

class StoryDetailPage extends StatelessWidget {
  final StorySchema story;

  StoryDetailPage({@required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(story.title),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile( 
                        title: Text("Title"),
                        subtitle: Text(story.title),
                      ),
                      ListTile(
                        title: Text("ID"),
                        subtitle: Text("${story.url}"),
                      ),
                      ListTile(
                        title: Text("Body"),
                        subtitle: Text(story.abstract),
                      ),
                      ListTile(
                        title: Text("User ID"),
                        subtitle: Text("${story.createdDate}"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
