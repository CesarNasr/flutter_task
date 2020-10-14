import 'package:fluttertask/data/localdb/database.dart';
import 'package:fluttertask/data/repositories/StoryMultimediaRepository.dart';

class StoryDetailPageViewModel {
  // This class os resonsible for the business logic of the StoryDetailsPage Widget ,
  // it communicates with the UI as well as with the data repository, which in turn talk with the localdb/network

  AppDatabase appDatabase;
  DataRepository repository;

  StoryDetailPageViewModel(this.appDatabase) {
    repository = new DataRepository(appDatabase);
  }

  void bookmarkStory(storySchema) {
    return repository.insertStory(storySchema);
  }

//  Future<void> getAllStories() async {
//    return await repository.getAllStories();
//  }
}
