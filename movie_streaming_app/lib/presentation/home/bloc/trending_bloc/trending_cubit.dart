import 'package:bloc/bloc.dart';
import 'package:movie_streaming_app/domain/movies/usecases/get_trending_movies.dart';
import 'package:movie_streaming_app/presentation/home/bloc/trending_bloc/trending_state.dart';
import 'package:movie_streaming_app/service_locator.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingMoviesLoading());

  void getTrendingMovies() async {
    var returnedData = await sl<GetTrendingMoviesUseCase>().call();
    returnedData.fold(
      (error) {
        emit(FailureTrendingMovies(errorMsg: error));
      },
      (data) {
        emit(TrendingMoviesLoaded(movies: data));
      },
    );
  }
}
