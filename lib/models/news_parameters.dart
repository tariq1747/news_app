import 'dart:convert';

class NewsParameters {
  final String? category;
  final String apiKey;
  final int? page;
  final int? pageSize;
  final String? country;
  final String? q;
  NewsParameters({
    this.category,
    required this.apiKey,
    this.page,
    this.pageSize,
    this.country,
    this.q,
  });

  NewsParameters copyWith({
    String? category,
    String? apiKey,
    int? page,
    int? pageSize,
    String? country,
    String? q,
  }) {
    return NewsParameters(
      category: category ?? this.category,
      apiKey: apiKey ?? this.apiKey,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      country: country ?? this.country,
      q: q ?? this.q,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category,
      'apiKey': apiKey,
      'page': page,
      'pageSize': pageSize,
      'country': country,
      'q': q,
    };
  }

  factory NewsParameters.fromMap(Map<String, dynamic> map) {
    return NewsParameters(
      category: map['category'] != null ? map['category'] as String : null,
      apiKey: map['apiKey'] as String,
      page: map['page'] != null ? map['page'] as int : null,
      pageSize: map['pageSize'] != null ? map['pageSize'] as int : null,
      country: map['country'] != null ? map['country'] as String : null,
      q: map['q'] != null ? map['q'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsParameters.fromJson(String source) =>
      NewsParameters.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NewsParameters(category: $category, apiKey: $apiKey, page: $page, pageSize: $pageSize, country: $country, q: $q)';
  }

  @override
  bool operator ==(covariant NewsParameters other) {
    if (identical(this, other)) return true;

    return other.category == category &&
        other.apiKey == apiKey &&
        other.page == page &&
        other.pageSize == pageSize &&
        other.country == country &&
        other.q == q;
  }

  @override
  int get hashCode {
    return category.hashCode ^
        apiKey.hashCode ^
        page.hashCode ^
        pageSize.hashCode ^
        country.hashCode ^
        q.hashCode;
  }
}
