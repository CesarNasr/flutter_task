import 'package:fluttertask/data/localdb/database.dart';
import 'package:fluttertask/data/models/StorySchema.dart';
import 'package:fluttertask/data/network/HttpService.dart';

class DataRepository {
  // this is the Data Repo, it is resonsible for communicating with data sources whether it was a Server call / Local DB / Mock data for testing

  final AppDatabase database;
  final HttpService httpService = HttpService();

  DataRepository([this.database]);

  insertStory(StorySchema storySchema) async {
    // insert record in local db
    return await database.storyDao
        .insertStoryWithCorrespondingMedia(storySchema, database);
  }

  Future<List<StorySchema>> getAllStories() async {
    // get all local stories bookmarked by user
    return database.storyDao.getAllStoriesWithCorrespondingMedia(database);
  }

  Future<List<StorySchema>> getOnlineStories() {
    // get server data
    return httpService.getStories();
  }

  Future<int> deleteLocalStory(StorySchema story) {
    // delete local story
    return database.storyDao.deleteStory(story);
  }
}
