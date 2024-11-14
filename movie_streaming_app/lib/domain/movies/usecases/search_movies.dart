import 'package:dartz/dartz.dart';
import 'package:movie_streaming_app/core/usecases/usecase.dart';
import 'package:movie_streaming_app/domain/movies/repositories/movie_repo.dart';
import 'package:movie_streaming_app/service_locator.dart';


class SearchMovieUseCase extends UseCase<Either, String> {

  @override
  Future<Either> call({String? params}) async {
    return await sl<MovieRepository>().searchMovie(params ?? '');
  }
}
