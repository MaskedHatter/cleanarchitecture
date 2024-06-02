import 'dart:developer';

import 'package:cleanarchitecture/core/resources/data_state.dart';
import 'package:cleanarchitecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:cleanarchitecture/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:cleanarchitecture/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;
  RemoteArticlesBloc(this._getArticleUseCase)
      : super(const RemoteArticleLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase.call();
    //log(dataState.data!.toString());

    if (dataState is DataSuccess) {
      if (dataState.data!.isNotEmpty) {
        emit(RemoteArticleDone(dataState.data!));
      }
      
    }

    if (dataState is DataFailed) {
      print(dataState.error!);
      emit(RemoteArticleError(dataState.error!));
    }
  }
}
