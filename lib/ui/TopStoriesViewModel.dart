import 'package:fluttertask/data/models/StorySchema.dart';
import 'package:fluttertask/data/network/HttpService.dart';
import 'package:fluttertask/data/repositories/StoryMultimediaRepository.dart';

class TopStoriesViewModel {
  // This class os resonsible for the business logic of the Bookmarks Widget ,
  // it communicates with the UI as well as with the data repository, which in turn talk with the localdb/network


  final DataRepository dataRepo = DataRepository();

  Future<List<StorySchema>> getStories() async {
    return dataRepo.getOnlineStories();
  }
}