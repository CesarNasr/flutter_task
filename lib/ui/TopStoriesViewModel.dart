import 'package:fluttertask/data/network/HttpService.dart';
import 'package:fluttertask/data/network/models/StorySchema.dart';

class TopStoriesViewModel {
  final HttpService httpService = HttpService();

  Future<List<StorySchema>> getStories() async {
    return httpService.getStories();
  }
}
