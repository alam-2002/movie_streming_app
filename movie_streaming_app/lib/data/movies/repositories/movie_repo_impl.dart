import 'package:dartz/dartz.dart';
import 'package:movie_streaming_app/common/helper/mapper/movie_mapper.dart';
import 'package:movie_streaming_app/common/helper/mapper/trailer_mapper.dart';
import 'package:movie_streaming_app/core/global_models/trailer_model.dart';
import 'package:movie_streaming_app/data/movies/models/movie_model.dart';
import 'package:movie_streaming_app/data/movies/sources/movie_api_service.dart';
import 'package:movie_streaming_app/domain/movies/repositories/movie_repo.dart';
import 'package:movie_streaming_app/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var returnedData = await sl<MovieService>().getTrendingMovies();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content']).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    var returnedData = await sl<MovieService>().getNowPlayingMovies();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content']).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getMovieTrailer(int movieId) async {
    var returnedData = await sl<MovieService>().getMovieTrailer(movieId);

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = TrailerMapper.toEntity(TrailerModel.fromJson(data['trailer']));
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getRecommendationMovies(int movieId) async {
    var returnedData = await sl<MovieService>().getRecommendationMovies(movieId);

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content']).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getSimilarMovies(int movieId) async{
    var returnedData = await sl<MovieService>().getSimilarMovies(movieId);

    return returnedData.fold(
          (error) {
        return Left(error);
      },
          (data) {
        var movies = List.from(data['content']).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> searchMovie(String query) async {
    var returnedData = await sl<MovieService>().searchMovie(query);

    return returnedData.fold(
          (error) {
        return Left(error);
      },
          (data) {
        var movies = List.from(data['content']).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }
}
