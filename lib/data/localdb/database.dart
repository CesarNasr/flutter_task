// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:fluttertask/data/models/Multimedia.dart';
import 'package:fluttertask/data/models/MultimediaDao.dart';
import 'package:fluttertask/data/models/StoryDao.dart';
import 'package:fluttertask/data/models/StorySchema.dart';

import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [StorySchema, Multimedia])
abstract class AppDatabase extends FloorDatabase {
  StoryDao get storyDao;

  MultimediaDao get multiMediaDao;
}
