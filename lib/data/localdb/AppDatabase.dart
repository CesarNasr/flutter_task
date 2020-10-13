// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'entities/Story.dart';

part 'entities/database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Story])
abstract class AppDatabase extends FloorDatabase {
  StoryDao get newsDao;
}