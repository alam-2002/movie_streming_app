import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_streaming_app/common/bloc/generic_data_cubit.dart';
import 'package:movie_streaming_app/common/bloc/generic_data_state.dart';
import 'package:movie_streaming_app/common/widgets/movie_card.dart';
import 'package:movie_streaming_app/domain/movies/entities/movie_entity.dart';
import 'package:movie_streaming_app/domain/movies/usecases/get_similar_movies.dart';
import 'package:movie_streaming_app/service_locator.dart';

class SimilarMovies extends StatelessWidget {
  final int movieId;
  const SimilarMovies({required this.movieId,super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()..getData<List<MovieEntity>>(sl<GetSimilarMoviesUseCase>(),params: movieId),
      child: BlocBuilder<GenericDataCubit,GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading){
            return const Center(
              child: CircularProgressIndicator()
            );
          }
          
          if (state is DataLoaded ){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Similar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
                const SizedBox(height: 16,),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MovieCard(
                        movieEntity: state.data[index],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(width: 10,),
                    itemCount: state.data.length
                  ),
                ),
              ],
            );
          }

          if (state is FailureData) {
            return Text(state.errorMsg);
          }

          return Container();
        },
      )
    );
  }
}