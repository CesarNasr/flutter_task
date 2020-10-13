import 'StorySchema.dart';

class ApiResponse {

  String status;
  String copyright;
  String section;
  String lastUpdated;
  int numResults;
  List<StorySchema> stories;

  ApiResponse({this.status,
    this.copyright,
    this.section,
    this.lastUpdated,
    this.numResults,
    this.stories});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    copyright = json['copyright'];
    section = json['section'];
    lastUpdated = json['last_updated'];
    numResults = json['num_results'];
    if (json['results'] != null) {
      stories = new List<StorySchema>();
      json['results'].forEach((v) {
        stories.add(new StorySchema.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['copyright'] = this.copyright;
    data['section'] = this.section;
    data['last_updated'] = this.lastUpdated;
    data['num_results'] = this.numResults;
    if (this.stories != null) {
      data['results'] = this.stories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
