import 'package:clean_architecture/core/constants/constants.dart';
import 'package:clean_architecture/features/daily_news/data/models/article.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'news_api_service.g.dart';

// call api with retrofit package
@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/v2/everything')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query('q') String? q,
    @Query('from') String? from,
    @Query('apiKey') String? apiKey,
  });
}
