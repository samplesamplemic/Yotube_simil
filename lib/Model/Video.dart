class Video {
  String? kind;
  String? etag;
  String? regionCode;
  List<Items> items;

  Video({this.kind, this.etag, this.regionCode, required this.items});

  factory Video.fromJson(Map<String, dynamic> json) {
    var list = json['items'] as List;
    return Video(
        kind: json['kind'],
        etag: json['tag'],
        regionCode: json['regionCode'],
        items: list.isNotEmpty ? list.map((e) => Items.fromJson(e)).toList() : []);
  }
}

class Items {
  String kind;
  String etag;
  ResourceId id;
  Snippet snippet;

  Items({required this.kind, required this.etag, required this.id, required this.snippet});

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
        kind: json['kind'],
        etag: json['etag'],
        id: ResourceId.fromJson(json['id']),
        snippet: Snippet.fromJson(json['snippet']));
  }
}

class ResourceId {
  String kind;
  String videoId;

  ResourceId({required this.kind, required this.videoId});

  factory ResourceId.fromJson(Map<String, dynamic> json) {
    return ResourceId(
      kind: json['kind'],
      videoId: json['videoId'] == null ? '' : json['videoId'] as String,
    );
  }
}

class Snippet {
  String publishedAt;
  String title;
  String description;
  Thumbnails thumbnailsOption;
  String channelTitle;
  String publishTime;

  Snippet(
      {required this.publishedAt,
      required this.title,
      required this.description,
      required this.thumbnailsOption,
      required this.channelTitle,
      required this.publishTime});

  factory Snippet.fromJson(Map<String, dynamic> json) {
    return Snippet(
        publishedAt: json['publishedAt'],
        title: json['title'],
        description: json['description'],
        thumbnailsOption: Thumbnails.fromJson(json['thumbnails']),
        channelTitle: json['channelTitle'],
        publishTime: json['publishTime']);
  }
}

class Thumbnails {
  Default defaultOption;
  Medium medium;
  High high;

  Thumbnails({required this.defaultOption, required this.medium, required this.high});

  factory Thumbnails.fromJson(Map<String, dynamic> json) {
    return Thumbnails(
        defaultOption: Default.fromJson(json['default']),
        medium: Medium.fromJson(json['medium']),
        high: High.fromJson(json['high']));
  }
}

class Default {
  String url;
  int width;
  int height;

  Default({required this.url, required this.width, required this.height});

  factory Default.fromJson(Map<String, dynamic> json) {
    return Default(
      url: json['url'],
      width: json['width'],
      height: json['height'],
    );
  }
}

class Medium {
  String url;
  int width;
  int height;

  Medium({required this.url, required this.width, required this.height});

  factory Medium.fromJson(Map<String, dynamic> json) {
    return Medium(
      url: json['url'],
      width: json['width'],
      height: json['height'],
    );
  }
}

class High {
  String url;
  int width;
  int height;

  High({required this.url, required this.width, required this.height});

  factory High.fromJson(Map<String, dynamic> json) {
    return High(
      url: json['url'],
      width: json['width'],
      height: json['height'],
    );
  }
}
