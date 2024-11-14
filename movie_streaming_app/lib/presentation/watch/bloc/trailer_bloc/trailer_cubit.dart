import 'package:bloc/bloc.dart';
import 'package:movie_streaming_app/core/global_entities/trailer_entity.dart';
import 'package:movie_streaming_app/domain/movies/usecases/get_movie_trailer.dart';
import 'package:movie_streaming_app/presentation/watch/bloc/trailer_bloc/trailer_state.dart';
import 'package:movie_streaming_app/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());

  Future<void> getMovieTrailer(int movieId) async {
    var returnedData = await sl<GetMovieTrailerUseCase>().call(params: movieId);
    returnedData.fold(
      (error) {
        emit(FailureTrailer(errorMsg: error));
      },
      (data) async {
        TrailerEntity trailerEntity = data;
        YoutubePlayerController youtubePlayerCtrl = YoutubePlayerController(
          initialVideoId: trailerEntity.key!,
          flags: YoutubePlayerFlags(autoPlay: false, loop: false),
        );
        emit(TrailerLoaded(controller: youtubePlayerCtrl));
      },
    );
  }
}
