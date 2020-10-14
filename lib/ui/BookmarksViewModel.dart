import 'package:fluttertask/data/localdb/database.dart';
import 'package:fluttertask/data/models/StorySchema.dart';
import 'package:fluttertask/data/repositories/StoryMultimediaRepository.dart';

class BookmarksViewModel {
  // This class os resonsible for the business logic of the Bookmarks Widget ,
  // it communicates with the UI as well as with the data repository, which in turn talk with the localdb/network
  DataRepository repository;
  AppDatabase appDatabase;

  BookmarksViewModel(this.appDatabase) {
    repository = new DataRepository(appDatabase);
  }

  Future<List<StorySchema>> getAllStories() async {
    return await repository.getAllStories();
  }

  Future<int> deleteStory(StorySchema story) async {
    return await repository.deleteLocalStory(story);
  }
}
