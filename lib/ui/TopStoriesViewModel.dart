import 'package:fluttertask/data/models/StorySchema.dart';
import 'package:fluttertask/data/network/HttpService.dart';

class TopStoriesViewModel {
  final HttpService httpService = HttpService();

  Future<List<StorySchema>> getStories() async {
    return httpService.getStories();
  }
}