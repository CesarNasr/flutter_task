import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertask/assets/Strings.dart';
import 'package:fluttertask/data/localdb/database.dart';
import 'package:fluttertask/data/models/StorySchema.dart';
import 'package:fluttertask/data/repositories/StoryMultimediaRepository.dart';
import 'package:fluttertask/ui/StoryDetailPageViewModel.dart';
import 'package:fluttertask/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:url_launcher/url_launcher.dart';

class StoryDetailPage extends StatelessWidget {
  final StorySchema story;
  StoryDetailPageViewModel _storyDetailPageViewModel;

  StoryDetailPage(this._storyDetailPageViewModel, {@required this.story});

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(story.title),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[_detailsOutlineWidget()],
            ),
          ),
        ));
  }

  void _displaySuccessSnackBar() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Story added to Bookmarks!"),
    ));
  }

  Widget _bookmarkFloatingButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: FloatingActionButton(
              onPressed: () {
                _storyDetailPageViewModel.bookmarkStory(story);
                _displaySuccessSnackBar();

                //finally in the topmost code use this key in the following way
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
    );
  }

  Widget _detailsOutlineWidget() {
    return Card(
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
            subtitle: Text("${Utils().getFormattedDate(story.publishedDate)}"),
          ),
          ListTile(
            title: Text(Strings.storyUrl),

            subtitle: Text("${story.url}"),
            trailing: IconButton(
              icon: Icon(Icons.link),
              onPressed: () {
                _launchURL(story.url);
              },
            ),

//                          Text("${story.url}"),
          ),
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(child: CircularProgressIndicator()),
              ),
              Image.network(story.multimedia[0]?.url),
            ],
          ),
          _bookmarkFloatingButton()
        ],
      ),
    );
  }

  _launchURL(String url) async {
    // this function uses url_launcher to start url link
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
