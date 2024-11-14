import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_streaming_app/common/widgets/text_widget.dart';
import 'package:movie_streaming_app/presentation/watch/bloc/trailer_bloc/trailer_cubit.dart';
import 'package:movie_streaming_app/presentation/watch/bloc/trailer_bloc/trailer_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatelessWidget {
  final int id;
  const VideoPlayer({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrailerCubit()..getMovieTrailer(id),
      child: BlocBuilder<TrailerCubit, TrailerState>(
        builder: (context, state) {
          // Loading State
          if (state is TrailerLoading) {
            return Center(child: CircularProgressIndicator());
          }
          // Loaded State
          if (state is TrailerLoaded) {
            return YoutubePlayer(
              controller: state.controller,
              showVideoProgressIndicator: true,
            );
          }
          // Error State
          if (state is FailureTrailer) {
            return Center(child: Label(label: state.errorMsg));
          }
          // Default
          return Container();
        },
      ),
    );
  }
}
