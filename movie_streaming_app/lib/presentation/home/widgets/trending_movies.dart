import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_streaming_app/common/widgets/text_widget.dart';
import 'package:movie_streaming_app/core/configs/assets/app_images.dart';
import 'package:movie_streaming_app/presentation/home/bloc/trending_bloc/trending_cubit.dart';
import 'package:movie_streaming_app/presentation/home/bloc/trending_bloc/trending_state.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingCubit()..getTrendingMovies(),
      child: BlocBuilder<TrendingCubit, TrendingState>(
        builder: (context, state) {
          print(state);
          // Loading State
          if (state is TrendingMoviesLoading) {
            return Center(child: CircularProgressIndicator());
          }
          // Loaded State
          if (state is TrendingMoviesLoaded) {
            return FanCarouselImageSlider.sliderType1(
              imagesLink: state.movies.map((item) => AppImages.movieImageBasePath + item.posterPath.toString()).toList(),
              isAssets: false,
              autoPlay: false,
              sliderHeight: 400,
              showIndicator: true,
            );
          }
          // Error State
          if (state is FailureTrendingMovies) {
            return Center(child: Label(label: state.errorMsg));
          }
          // Default
          return Container();
        },
      ),
    );
  }
}
