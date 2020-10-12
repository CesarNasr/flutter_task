import 'StorySchema.dart';

class ApiResponse {
  String _status;
  String _copyright;
  String _section;
  String _lastUpdated;
  int _numResults;
  List<StorySchema> _stories;

  String get status => _status;
  String get copyright => _copyright;
  String get section => _section;
  String get lastUpdated => _lastUpdated;
  int get numResults => _numResults;
  List<StorySchema> get stories => _stories;

  ApiResponse({
    String status,
    String copyright,
    String section,
    String lastUpdated,
    int numResults,
    List<StorySchema> stories}){
    _status = status;
    _copyright = copyright;
    _section = section;
    _lastUpdated = lastUpdated;
    _numResults = numResults;
    _stories = stories;
  }

  ApiResponse.fromJson(dynamic json) {
    _status = json["status"];
    _copyright = json["copyright"];
    _section = json["section"];
    _lastUpdated = json["lastUpdated"];
    _numResults = json["numResults"];
    if (json["results"] != null) {
      _stories = [];
      json["results"].forEach((v) {
        _stories.add(StorySchema.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["copyright"] = _copyright;
    map["section"] = _section;
    map["lastUpdated"] = _lastUpdated;
    map["numResults"] = _numResults;
    if (_stories != null) {
      map["results"] = _stories.map((v) => v.toJson()).toList();
    }
    return map;
  }
}


