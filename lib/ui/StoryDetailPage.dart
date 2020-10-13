import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertask/assets/Strings.dart';
import 'package:fluttertask/data/localdb/database.dart';
import 'package:fluttertask/data/models/StorySchema.dart';
import 'package:fluttertask/data/repositories/StoryMultimediaRepository.dart';
import 'package:fluttertask/ui/StoryDetailPageViewModel.dart';
//import 'package:url_launcher/url_launcher.dart';

class StoryDetailPage extends StatelessWidget {
  final StorySchema story;
  StoryDetailPageViewModel _storyDetailPageViewModel;

  StoryDetailPage({@required this.story}) {
    init();
  }

  Future<void> init() async {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    database.storyDao.insertStory(story);
    _storyDetailPageViewModel = StoryDetailPageViewModel(database);
  }

//  StoryDetailPageViewModel

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
                        title: Text(Strings.storyTitle),
                        subtitle: Text(story.title),
                      ),
                      ListTile(
                        title: Text(Strings.storyAbstract),
                        subtitle: Text(story.abstract),
                      ),
                      ListTile(
                        title: Text(Strings.pubDate),
                        subtitle: Text("${story.publishedDate}"),
                      ),
                      ListTile(title: Text(Strings.storyUrl), subtitle: Text("")
//                          Text("${story.url}"),
                          ),
                      Container(
                        child: Image.network(story.multimedia[0]?.url),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: FloatingActionButton(
                                heroTag: "btn1",

                                onPressed: () {
                                  _storyDetailPageViewModel
                                      .bookmarkStory(story);

                                  // Add your onPressed code here!
                                },
                                child: Icon(Icons.bookmark),
                                backgroundColor: Colors.blue,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: FloatingActionButton(
                                heroTag: "btn2",

                                onPressed: () {
                                  _storyDetailPageViewModel.getAllStories();
                                  // Add your onPressed code here!
                                },
                                child: Icon(Icons.bookmark),
                                backgroundColor: Colors.blue,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(Strings.clickToBookmark),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

//                      Container(
//                        child: CarouselSlider.builder(
//                          itemCount: 15,
//                          itemBuilder: (BuildContext context, int itemIndex) =>
//                              Container(
//                                child: Text(itemIndex.toString()),
//                              ),
//                        )
//
//
////                        Image.network(story.multimedia[0]?.url),
//                      )

//  Widget getHyperLinkText(String string) {
//    String _url = "www.google.com";
//    _launchURL() async {
//      if (await canLaunch(_url)) {
//        await launch(_url);
//      } else {
//        throw 'Could not launch $_url';
//      }
//    }
//
//    return InkWell(
//      child: Text(
//        'press',
//        style: TextStyle(decoration: TextDecoration.underline),
//      ),
//      onTap: _launchURL,
//    );
//  }
}
