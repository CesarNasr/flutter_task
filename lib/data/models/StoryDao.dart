import 'package:floor/floor.dart';
import 'package:fluttertask/data/localdb/database.dart';
import 'package:fluttertask/data/models/Multimedia.dart';
import 'package:fluttertask/data/models/StorySchema.dart';

@dao
abstract class StoryDao {
  @Query('SELECT * FROM StorySchema')
  Future<List<StorySchema>> findAllStories();

  @Query('SELECT * FROM StorySchema WHERE id = :id')
  Stream<StorySchema> findStoryById(int id);

  @Query('SELECT * FROM StorySchema')
  Future<List<StorySchema>> getAllStories();

  @Insert(
      onConflict: OnConflictStrategy
          .replace) // replace the element if it already exists in db
  Future<int> insertStory(StorySchema story);

  @delete
  Future<int> deleteStory(StorySchema story);

  Future<void> insertStoryWithCorrespondingMedia(
      StorySchema storySchema, AppDatabase database) async {
    final multimediaDao = database.multiMediaDao;
    int storyId = await insertStory(storySchema);

    for (int i = 0; i < storySchema.multimedia.length; i++) {
      var multimedia = storySchema.multimedia[i];
      multimedia.storyId = storyId;

      await multimediaDao.insertMultimedia(multimedia);
    }
  }

  Future<List<StorySchema>> getAllStoriesWithCorrespondingMedia(
      AppDatabase database) async {
    final multimediaDao = database.multiMediaDao;

    List<StorySchema> stories = await getAllStories();

    for (int i = 0; i < stories.length; i++) {
      List<Multimedia> multimediaList =
          await multimediaDao.findMultimediaByStoryId(stories[i].id);
      stories[i].multimedia = multimediaList;
    }

    List<StorySchema> x = List();
    x.add(StorySchema());
    x.add(StorySchema());
    x.add(StorySchema());
    x.add(StorySchema());

    return stories;
  }
}
