import 'dart:math';

import 'package:clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

// part of 'remote_article_bloc.dart';

sealed class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;
  const RemoteArticleState({this.articles, this.error});

  @override
  List<Object> get props => [articles!, error!];
}

// event
class RemnoteArticlesLoading extends RemoteArticleState {
  const RemnoteArticlesLoading();
}

class RemoteArticlesDone extends RemoteArticleState {
  const RemoteArticlesDone(List<ArticleEntity> article)
      : super(articles: article);
}

class RemoteArticlesError extends RemoteArticleState {
  const RemoteArticlesError(DioException error) : super(error: error);
}
