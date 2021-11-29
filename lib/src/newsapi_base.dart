import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'newsapi_base.freezed.dart';
part 'newsapi_base.g.dart';

@RestApi(baseUrl: "https://newsapi.org/v2/")
abstract class NewsApi {
  factory NewsApi(Dio dio, {String baseUrl}) = _NewsApi;
  factory NewsApi.withApiKey(String apiKey) {
    final _dio = Dio(BaseOptions(headers: {"X-Api-Key": apiKey}));
    return NewsApi(_dio);
  }

  /// Search through millions of articles from over 80,000 large and small news sources and blogs.
  @GET("/everything")
  Future<ArticleResponse> everything({
    @Header("X-Api-Key") String? apiKey,
    @Query("q") String? q,
    @Query("qInTitle") String? qInTitle,
    @Query("sources") String? sources,
    @Query("domains") String? domains,
    @Query("excludeDomains") String? excludeDomains,
    @Query("from") String? from,
    @Query("to") String? to,
    @Query("language") String? language,
    @Query("sortBy") String? sortBy,
    @Query("pageSize") int? pageSize,
    @Query("page") int? page,
  });

  /// This endpoint provides live top and breaking headlines for a country,
  /// specific category in a country, single source, or multiple sources. You can also search with keywords.
  /// Articles are sorted by the earliest date published first.
  @GET("/top-headlines")
  Future<ArticleResponse> topHeadlines({
    @Header("X-Api-Key") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
    @Query("sources") String? sources,
    @Query("q") String? q,
    @Query("pageSize") int? pageSize,
    @Query("page") int? page,
  });

  /// This endpoint returns the subset of news publishers that top headlines (/v2/top-headlines) are available from.
  /// It's mainly a convenience endpoint that you can use to keep track of
  /// the publishers available on the API, and you can pipe it straight through to your users.
  @GET("/top-headlines/sources")
  Future<SourceResponse> sources({
    @Header("X-Api-Key") String? apiKey,
    @Query("category") String? category,
    @Query("language") String? language,
    @Query("country") String? country,
  });
}

@freezed
class ArticleResponse with _$ArticleResponse {
  const factory ArticleResponse({
    String? status,
    int? totalResults,
    List<Article>? articles,
  }) = _ArticleResponse;
  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseFromJson(json);
}

@freezed
class Article with _$Article {
  const factory Article({
    Map<String, dynamic>? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) = _Article;
  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}

@freezed
class SourceResponse with _$SourceResponse {
  const factory SourceResponse({
    String? status,
    List<Source>? sources,
  }) = _SourceResponse;
  factory SourceResponse.fromJson(Map<String, dynamic> json) =>
      _$SourceResponseFromJson(json);
}

@freezed
class Source with _$Source {
  const factory Source({
    String? id,
    String? name,
    String? description,
    String? url,
    String? category,
    String? language,
    String? country,
  }) = _Source;
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
