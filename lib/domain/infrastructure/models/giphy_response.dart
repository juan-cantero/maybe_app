class GiphyResponse {
  final List<GifData> data;
  final Pagination pagination;

  GiphyResponse({
    required this.data,
    required this.pagination,
  });

  factory GiphyResponse.fromJson(Map<String, dynamic> json) {
    return GiphyResponse(
      data: (json['data'] as List)
          .map((gifJson) => GifData.fromJson(gifJson))
          .toList(),
      pagination: Pagination.fromJson(json['pagination']),
    );
  }
}

class GifData {
  final String id;
  final String title;
  final GifImages images;

  GifData({
    required this.id,
    required this.title,
    required this.images,
  });

  factory GifData.fromJson(Map<String, dynamic> json) {
    return GifData(
      id: json['id'],
      title: json['title'],
      images: GifImages.fromJson(json['images']),
    );
  }
}

class GifImages {
  final GifImageVariant downsizedMedium;
  final GifImageVariant original;

  GifImages({
    required this.downsizedMedium,
    required this.original,
  });

  factory GifImages.fromJson(Map<String, dynamic> json) {
    return GifImages(
      downsizedMedium: GifImageVariant.fromJson(json['downsized_medium']),
      original: GifImageVariant.fromJson(json['original']),
    );
  }
}

class GifImageVariant {
  final String url;
  final String width;
  final String height;
  final String size;

  GifImageVariant({
    required this.url,
    required this.width,
    required this.height,
    required this.size,
  });

  factory GifImageVariant.fromJson(Map<String, dynamic> json) {
    return GifImageVariant(
      url: json['url'],
      width: json['width'],
      height: json['height'],
      size: json['size'],
    );
  }
}

class Pagination {
  final int totalCount;
  final int count;
  final int offset;

  Pagination({
    required this.totalCount,
    required this.count,
    required this.offset,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      totalCount: json['total_count'],
      count: json['count'],
      offset: json['offset'],
    );
  }
}