import 'package:fluttertask/data/localdb/database.dart';
import 'package:fluttertask/data/repositories/StoryMultimediaRepository.dart';

class StoryDetailPageViewModel {
  AppDatabase appDatabase;
  StoryMultimediaRepository repository;

  StoryDetailPageViewModel(this.appDatabase) {
    repository = new StoryMultimediaRepository(appDatabase);
  }

  void bookmarkStory(storySchema) {
    return repository.insertStory(storySchema);
  }

  Future<void> getAllStories() async {
    return await repository.getAllStories();
  }
}
