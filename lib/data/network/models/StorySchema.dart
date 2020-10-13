
import 'Multimedia.dart';

class StorySchema {
  String _section;
  String _subsection;
  String _title;
  String _abstract;
  String _url;
  String _uri;
  String _byline;
  String _itemType;
  String _updatedDate;
  String _createdDate;
  String _publishedDate;

  List<Multimedia> _multimedia;
  String _shortUrl;

  String get section => _section;
  String get subsection => _subsection;
  String get title => _title;
  String get abstract => _abstract;
  String get url => _url;
  String get uri => _uri;
  String get byline => _byline;
  String get itemType => _itemType;
  String get updatedDate => _updatedDate;
  String get createdDate => _createdDate;
  String get publishedDate => _publishedDate;

  List<Multimedia> get multimedia => _multimedia;
  String get shortUrl => _shortUrl;

  Results({
    String section,
    String subsection,
    String title,
    String abstract,
    String url,
    String uri,
    String byline,
    String itemType,
    String updatedDate,
    String createdDate,
    String publishedDate,
    String materialTypeFacet,
    String kicker,
    List<String> desFacet,
    List<String> orgFacet,
    List<String> perFacet,
    List<dynamic> geoFacet,
    List<Multimedia> multimedia,
    String shortUrl}){
    _section = section;
    _subsection = subsection;
    _title = title;
    _abstract = abstract;
    _url = url;
    _uri = uri;
    _byline = byline;
    _itemType = itemType;
    _updatedDate = updatedDate;
    _createdDate = createdDate;
    _publishedDate = publishedDate;

    _multimedia = multimedia;
    _shortUrl = shortUrl;
  }

  StorySchema.fromJson(dynamic json) {
    _section = json["section"];
    _subsection = json["subsection"];
    _title = json["title"];
    _abstract = json["abstract"];
    _url = json["url"];
    _uri = json["uri"];
    _byline = json["byline"];
    _itemType = json["item_type"];
    _updatedDate = json["updated_date"];
    _createdDate = json["created_date"];
    _publishedDate = json["published_date"];

    if (json["multimedia"] != null) {
      _multimedia = [];
      json["multimedia"].forEach((v) {
        _multimedia.add(Multimedia.fromJson(v));
      });
    }
    _shortUrl = json["shortUrl"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["section"] = _section;
    map["subsection"] = _subsection;
    map["title"] = _title;
    map["abstract"] = _abstract;
    map["url"] = _url;
    map["uri"] = _uri;
    map["byline"] = _byline;
    map["item_type"] = _itemType;
    map["updated_date"] = _updatedDate;
    map["created_date"] = _createdDate;
    map["published_date"] = _publishedDate;

    if (_multimedia != null) {
      map["multimedia"] = _multimedia.map((v) => v.toJson()).toList();
    }
    map["shortUrl"] = _shortUrl;
    return map;
  }

}
