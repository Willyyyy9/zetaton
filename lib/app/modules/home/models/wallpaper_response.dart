class WallpaperResponse {
  final List<WallpaperModel> wallpapers;
  final int totalResults;
  final String? nextPage;
  final String? prevPage;
  final int page;
  final int perPage;

  WallpaperResponse({
    required this.wallpapers,
    required this.totalResults,
    required this.nextPage,
    required this.prevPage,
    required this.page,
    required this.perPage,
  });

  factory WallpaperResponse.fromJson(Map<String, dynamic> json) {
    return WallpaperResponse(
      wallpapers: json["photos"]
          .map<WallpaperModel>((photo) => WallpaperModel.fromJson(photo))
          .toList(),
      totalResults: json["total_results"],
      nextPage: json["next_page"],
      prevPage: json["prev_page"],
      page: json["page"],
      perPage: json["per_page"],
    );
  }
}

class WallpaperModel {
  final int id;
  final String url;
  final String photographer;
  final String photographerUrl;
  final int photographerId;
  final String avgColor;
  final Src src;
  final bool liked;
  final String alt;

  WallpaperModel({
    required this.id,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.src,
    required this.liked,
    required this.alt,
  });

  factory WallpaperModel.fromJson(Map<String, dynamic> json) {
    return WallpaperModel(
      id: json["id"],
      url: json["url"],
      photographer: json["photographer"],
      photographerUrl: json["photographer_url"],
      photographerId: json["photographer_id"],
      avgColor: json["avg_color"],
      src: Src.fromJson(json["src"]),
      liked: json["liked"],
      alt: json["alt"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "url": url,
      "photographer": photographer,
      "photographer_url": photographerUrl,
      "photographer_id": photographerId,
      "avg_color": avgColor,
      "src": src.toJson(),
      "liked": liked,
      "alt": alt,
    };
  }
}

class Src {
  final String original;
  final String large2x;
  final String large;
  final String medium;
  final String small;
  final String portrait;
  final String landscape;
  final String tiny;

  Src({
    required this.original,
    required this.large2x,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny,
  });

  factory Src.fromJson(Map<String, dynamic> json) {
    return Src(
      original: json["original"],
      large2x: json["large2x"],
      large: json["large"],
      medium: json["medium"],
      small: json["small"],
      portrait: json["portrait"],
      landscape: json["landscape"],
      tiny: json["tiny"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "original": original,
      "large2x": large2x,
      "large": large,
      "medium": medium,
      "small": small,
      "portrait": portrait,
      "landscape": landscape,
      "tiny": tiny,
    };
  }
}
