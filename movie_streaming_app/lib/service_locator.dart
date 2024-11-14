import 'package:get_it/get_it.dart';
import 'package:movie_streaming_app/core/network/dio_client.dart';
import 'package:movie_streaming_app/data/auth/repositories/auth_repo_impl.dart';
import 'package:movie_streaming_app/data/auth/sources/auth_api_service.dart';
import 'package:movie_streaming_app/data/movies/repositories/movie_repo_impl.dart';
import 'package:movie_streaming_app/data/movies/sources/movie_api_service.dart';
import 'package:movie_streaming_app/data/tv/repositories/tv_repo_impl.dart';
import 'package:movie_streaming_app/data/tv/sources/tv_api_service.dart';
import 'package:movie_streaming_app/domain/auth/repositories/auth_repo.dart';
import 'package:movie_streaming_app/domain/auth/usecases/is_logged_in_usecase.dart';
import 'package:movie_streaming_app/domain/auth/usecases/signin_usecase.dart';
import 'package:movie_streaming_app/domain/auth/usecases/signup_usecase.dart';
import 'package:movie_streaming_app/domain/movies/repositories/movie_repo.dart';
import 'package:movie_streaming_app/domain/movies/usecases/get_movie_trailer.dart';
import 'package:movie_streaming_app/domain/movies/usecases/get_now_playing_movies.dart';
import 'package:movie_streaming_app/domain/movies/usecases/get_recommendation_movies.dart';
import 'package:movie_streaming_app/domain/movies/usecases/get_similar_movies.dart';
import 'package:movie_streaming_app/domain/movies/usecases/get_trending_movies.dart';
import 'package:movie_streaming_app/domain/movies/usecases/search_movies.dart';
import 'package:movie_streaming_app/domain/tv/repositories/tv_repo.dart';
import 'package:movie_streaming_app/domain/tv/usecases/get_keywords.dart';
import 'package:movie_streaming_app/domain/tv/usecases/get_popular_tv.dart';
import 'package:movie_streaming_app/domain/tv/usecases/get_recommendation_tvs.dart';
import 'package:movie_streaming_app/domain/tv/usecases/get_similar_tvs.dart';
import 'package:movie_streaming_app/domain/tv/usecases/search_tv.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Service
  sl.registerSingleton<AuthService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieService>(MovieApiServiceImpl());
  sl.registerSingleton<TVService>(TVApiServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  sl.registerSingleton<TVRepository>(TVRepositoryImpl());

  // Use Cases
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
  sl.registerSingleton<GetNowPlayingMoviesUseCase>(GetNowPlayingMoviesUseCase());
  sl.registerSingleton<GetPopularTVUseCase>(GetPopularTVUseCase());
  sl.registerSingleton<GetMovieTrailerUseCase>(GetMovieTrailerUseCase());
  sl.registerSingleton<GetRecommendationMoviesUseCase>(GetRecommendationMoviesUseCase());
  sl.registerSingleton<GetSimilarMoviesUseCase>(GetSimilarMoviesUseCase());
  sl.registerSingleton<GetRecommendationTVsUseCase>(GetRecommendationTVsUseCase());
  sl.registerSingleton<GetSimilarTVsUseCase>(GetSimilarTVsUseCase());
  sl.registerSingleton<GetTVKeywordsUseCase>(GetTVKeywordsUseCase());
  sl.registerSingleton<SearchMovieUseCase>(SearchMovieUseCase());
  sl.registerSingleton<SearchTVUseCase>(SearchTVUseCase());
}
