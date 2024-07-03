import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;
  RemoteArticleBloc(this._getArticleUseCase)
      : super(const RemnoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  // method get api articles
  void onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      print('Call api success!');
      emit(
        RemoteArticlesDone(dataState.data!),
      );
    } else if (dataState is DataFailed) {
      print(dataState.error);
      emit(
        RemoteArticlesError(dataState.error!),
      );
    }
  }
}
