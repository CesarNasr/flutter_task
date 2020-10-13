import 'package:floor/floor.dart';

import 'Multimedia.dart';

@dao
abstract class MultimediaDao {
  @Query('SELECT * FROM Multimedia')
  Future<List<Multimedia>> findAllMultimedia();

  @Query('SELECT * FROM Multimedia WHERE id = :id')
  Stream<Multimedia> findMultimediaById(int id);


  @Query('SELECT * FROM Multimedia WHERE storyId = :storyId')
  Future<List<Multimedia>> findMultimediaByStoryId(int storyId);

  @insert
  Future<void> insertMultimedia(Multimedia multimedia);
}
