// entity/person.dart

import 'package:floor/floor.dart';

@entity
class Story {
  @primaryKey
  final int id;

  final String name;

  Story(this.id, this.name);
}

@dao
abstract class StoryDao {
  @Query('SELECT * FROM Story')
  Future<List<Story>> findAllStoroes();

  @Query('SELECT * FROM Story WHERE id = :id')
  Stream<Story> findStoryById(int id);

  @insert
  Future<void> insertStory(Story story);
}
