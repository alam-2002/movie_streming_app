import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_streaming_app/common/widgets/movie_card.dart';
import 'package:movie_streaming_app/common/widgets/text_widget.dart';
import 'package:movie_streaming_app/common/widgets/tv_card.dart';
import 'package:movie_streaming_app/presentation/search/bloc/search_cubit.dart';
import 'package:movie_streaming_app/presentation/search/bloc/search_state.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        // loading state
        if (state is SearchLoading) {
          return Center(child: CircularProgressIndicator());
        }

        // movie loaded state
        if (state is SearchMovieLoaded) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.6,
            ),
            shrinkWrap: true,
            itemCount: state.movies.length,
            itemBuilder: (context, index) {
              return MovieCard(
                movieEntity: state.movies[index],
              );
            },
          );
        }

        // tv loaded state
        if (state is SearchTVLoaded) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.6,
            ),
            shrinkWrap: true,
            itemCount: state.tvs.length,
            itemBuilder: (context, index) {
              return TVCard(
                tvEntity: state.tvs[index],
              );
            },
          );
        }

        // error state
        if (state is SearchFailure) {
          return Center(child: Label(label: state.errorMsg));
        }

        // default
        return Container();
      },
    );
  }
}
