import 'package:flutter/material.dart';
import 'package:fluttertask/data/models/StorySchema.dart';
import 'package:fluttertask/ui/BookmarksViewModel.dart';
import 'package:fluttertask/ui/StoryDetailPageViewModel.dart';
import 'package:fluttertask/utils/utils.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';

import 'StoryDetailPage.dart';

class BookmarksPage extends StatelessWidget {
  BookmarksViewModel _bookmarksViewModel;
  StoryDetailPageViewModel _storyDetailPageViewModel;

  BookmarksPage(this._storyDetailPageViewModel, this._bookmarksViewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _bookmarksViewModel.getAllStories(),
        builder:
            (BuildContext context, AsyncSnapshot<List<StorySchema>> snapshot) {
          if (snapshot.hasData && snapshot != null) {
            List<StorySchema> stories =
                snapshot.data.obs; // USING get X library to observe the list

            return Obx(
                () => // when a list item gets deleted, since we're obsrving stories list, the UI gets updated using the Obx from get X lib.
                    ListView(
                      children: stories
                          .map(
                            (StorySchema story) => _createListTile(
                                story, // deleted story
                                (index) => // function holding action on delete with id passed to it
                                    {
                                      stories.removeWhere(
                                          (element) => element.id == story.id),
                                      // remove from local list that is being observed

                                      _bookmarksViewModel.deleteStory(story)
                                      // delete from sqlite DB
                                    }),
                          )
                          .toList(),
                    ));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  void _navigate(
      StorySchema story, StoryDetailPageViewModel storyDetailPageViewModel) {
    //NOTE: Here, I used the GetX Library , it's light and simple ,
    // it abstracts sevceral lines of code to navigate between widgets!
    Get.to(StoryDetailPage(
      storyDetailPageViewModel,
      story: story,
    ));
  }

  Widget _createListTile(StorySchema story, Function(int id) delete) {
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
            subtitle:
                Text(Utils().getFormattedDate(story.publishedDate).toString()),
            onTap: () => _navigate(story, _storyDetailPageViewModel),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                delete(story.id);
              },
            ),
          ),
        ),
      ),
    );
  }
}
