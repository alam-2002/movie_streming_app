import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_streaming_app/common/bloc/generic_data_cubit.dart';
import 'package:movie_streaming_app/common/bloc/generic_data_state.dart';
import 'package:movie_streaming_app/common/widgets/movie_card.dart';
import 'package:movie_streaming_app/common/widgets/text_widget.dart';
import 'package:movie_streaming_app/domain/movies/entities/movie_entity.dart';
import 'package:movie_streaming_app/domain/movies/usecases/get_now_playing_movies.dart';
import 'package:movie_streaming_app/service_locator.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()..getData<List<MovieEntity>>(sl<GetNowPlayingMoviesUseCase>()),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          print(state);
          // Loading State
          if (state is DataLoading) {
            return Center(child: CircularProgressIndicator());
          }
          // Loaded State
          if (state is DataLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: state.data.length,
                padding: EdgeInsets.symmetric(horizontal: 15),
                itemBuilder: (context, index) {
                  return MovieCard(movieEntity: state.data[index]);
                },
              ),
            );
          }
          // Error State
          if (state is FailureData) {
            return Center(child: Label(label: state.errorMsg));
          }
          // Default
          return Container();
        },
      ),
    );
  }
}
