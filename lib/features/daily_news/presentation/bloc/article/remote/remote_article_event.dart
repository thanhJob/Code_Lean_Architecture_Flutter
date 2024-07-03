import 'package:equatable/equatable.dart';

abstract class RemoteArticleEvent {
  const RemoteArticleEvent();
}

class GetArticles extends RemoteArticleEvent {
  const GetArticles();
}
