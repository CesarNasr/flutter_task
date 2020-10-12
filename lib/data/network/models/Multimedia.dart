

class Multimedia {
  String _url;
  String _format;
  int _height;
  int _width;
  String _type;
  String _subtype;
  String _caption;
  String _copyright;

  String get url => _url;
  String get format => _format;
  int get height => _height;
  int get width => _width;
  String get type => _type;
  String get subtype => _subtype;
  String get caption => _caption;
  String get copyright => _copyright;

  Multimedia({
    String url,
    String format,
    int height,
    int width,
    String type,
    String subtype,
    String caption,
    String copyright}){
    _url = url;
    _format = format;
    _height = height;
    _width = width;
    _type = type;
    _subtype = subtype;
    _caption = caption;
    _copyright = copyright;
  }

  Multimedia.fromJson(dynamic json) {
    _url = json["url"];
    _format = json["format"];
    _height = json["height"];
    _width = json["width"];
    _type = json["type"];
    _subtype = json["subtype"];
    _caption = json["caption"];
    _copyright = json["copyright"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["url"] = _url;
    map["format"] = _format;
    map["height"] = _height;
    map["width"] = _width;
    map["type"] = _type;
    map["subtype"] = _subtype;
    map["caption"] = _caption;
    map["copyright"] = _copyright;
    return map;
  }

}