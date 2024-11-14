import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_streaming_app/domain/movies/usecases/search_movies.dart';
import 'package:movie_streaming_app/domain/tv/usecases/search_tv.dart';
import 'package:movie_streaming_app/presentation/search/bloc/search_state.dart';
import 'package:movie_streaming_app/presentation/search/bloc/selectable_cubit.dart';
import 'package:movie_streaming_app/service_locator.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  TextEditingController textCtrl = TextEditingController();

  void search(String query, SearchType searchType) {
    emit(SearchLoading());
    if(query.isNotEmpty){
      emit(SearchLoading());
      switch (searchType) {
        case SearchType.movie:
          searchMovie(query);
          break;
        case SearchType.tv:
          searchTV(query);
          break;
      }
    }
  }

  void searchMovie(String query) async {
    var returnedData = await sl<SearchMovieUseCase>().call(params: query);
    returnedData.fold(
      (error) {
        emit(SearchFailure(errorMsg: error));
      },
      (dara) {
        emit(SearchMovieLoaded(movies: dara));
      },
    );
  }

  void searchTV(String query) async {
    var returnedData = await sl<SearchTVUseCase>().call(params: query);
    returnedData.fold(
      (error) {
        emit(SearchFailure(errorMsg: error));
      },
      (dara) {
        emit(SearchTVLoaded(tvs: dara));
      },
    );
  }
}
