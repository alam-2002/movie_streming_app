import 'package:dartz/dartz.dart';
import 'package:movie_streaming_app/core/usecases/usecase.dart';
import 'package:movie_streaming_app/domain/movies/repositories/movie_repo.dart';
import 'package:movie_streaming_app/service_locator.dart';


class GetTrendingMoviesUseCase extends UseCase<Either, dynamic> {

  @override
  Future<Either> call({params}) async {
    return await sl<MovieRepository>().getTrendingMovies();
  }
}
