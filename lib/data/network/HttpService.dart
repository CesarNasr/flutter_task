import 'dart:convert';

import 'package:fluttertask/data/network/models/ApiResponse.dart';
import 'package:fluttertask/data/network/models/StorySchema.dart';
import 'package:http/http.dart';

class HttpService {
  final String API_KEY = "K0WCoMg2HCniGnNzCxCElm2n62cLyioU";
  final String postsURL =
      "https://api.nytimes.com/svc/topstories/v2/home.json?api-key=";

  Future<List<StorySchema>> getStories() async {
    Response res = await get(postsURL + API_KEY);

    try {
      if (res.statusCode == 200) {
        dynamic body = jsonDecode(res.body);

        ApiResponse apiResponse = ApiResponse.fromJson(body);

        return apiResponse.stories;
      } else {
        throw "Can't get stories`.";
      }
    } catch (error) {
      throw "Can't get stories`.";
    }
  }
}
