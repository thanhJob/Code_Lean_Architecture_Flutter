import 'dart:io';
import 'package:dio/dio.dart';

import 'package:clean_architecture/core/constants/constants.dart';
import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_architecture/features/daily_news/data/models/article.dart';
import 'package:clean_architecture/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  // method call api
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        q: qQuery,
        from: fromQuery,
        apiKey: newsAPIKey,
      );

      // check call success
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
