import 'package:dartz/dartz.dart';
import 'package:movie_streaming_app/core/usecases/usecase.dart';
import 'package:movie_streaming_app/domain/movies/repositories/movie_repo.dart';
import 'package:movie_streaming_app/service_locator.dart';


class GetSimilarMoviesUseCase extends UseCase<Either, int> {

  @override
  Future<Either> call({int? params}) async {
    return await sl<MovieRepository>().getSimilarMovies(params ?? 889737);
  }
}
