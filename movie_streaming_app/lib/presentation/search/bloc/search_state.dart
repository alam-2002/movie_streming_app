import 'package:equatable/equatable.dart';
import 'package:movie_streaming_app/domain/movies/entities/movie_entity.dart';
import 'package:movie_streaming_app/domain/tv/entities/tv_entity.dart';

abstract class SearchState extends Equatable {}

class SearchInitial extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchLoading extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchMovieLoaded extends SearchState {
  final List<MovieEntity> movies;
  SearchMovieLoaded({required this.movies});

  @override
  List<Object?> get props => [movies];
}

class SearchTVLoaded extends SearchState {
  final List<TVEntity> tvs;
  SearchTVLoaded({required this.tvs});

  @override
  List<Object?> get props => [tvs];
}

class SearchFailure extends SearchState {
  final String errorMsg;
  SearchFailure({required this.errorMsg});

  @override
  List<Object?> get props => [errorMsg];
}
