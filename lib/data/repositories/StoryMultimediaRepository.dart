import 'package:fluttertask/data/localdb/database.dart';
import 'package:fluttertask/data/models/StorySchema.dart';

class StoryMultimediaRepository {
  final AppDatabase database;

  StoryMultimediaRepository(this.database);

  insertStory(StorySchema storySchema) async {
//    return await database.storyDao.insertStory(storySchema);

    return await database.storyDao.insertStoryWithCorrespondingMedia(storySchema, database);

////
  }

  Future<List<StorySchema>> getAllStories(){
    return database.storyDao.getAllStoriesWithCorrespondingMedia(database);
  }
//  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

}
