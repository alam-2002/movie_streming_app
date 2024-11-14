import 'package:equatable/equatable.dart';
import 'package:movie_streaming_app/domain/movies/entities/movie_entity.dart';

abstract class TrendingState extends Equatable {}

class TrendingMoviesLoading extends TrendingState {
  @override
  List<Object?> get props => [];
}

class TrendingMoviesLoaded extends TrendingState {
  final List<MovieEntity> movies;
  TrendingMoviesLoaded({required this.movies});

  @override
  List<Object?> get props => [movies];
}

class FailureTrendingMovies extends TrendingState {
  final String errorMsg;
  FailureTrendingMovies({required this.errorMsg});

  @override
  List<Object?> get props => [errorMsg];
}
