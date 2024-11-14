import 'package:flutter/material.dart';
import 'package:movie_streaming_app/common/widgets/app_bar.dart';
import 'package:movie_streaming_app/domain/movies/entities/movie_entity.dart';
import 'package:movie_streaming_app/presentation/watch/widgets/recommendation_movies.dart';
import 'package:movie_streaming_app/presentation/watch/widgets/similar_movies.dart';
import 'package:movie_streaming_app/presentation/watch/widgets/video_overview.dart';
import 'package:movie_streaming_app/presentation/watch/widgets/video_player.dart';
import 'package:movie_streaming_app/presentation/watch/widgets/video_release_date.dart';
import 'package:movie_streaming_app/presentation/watch/widgets/video_title.dart';
import 'package:movie_streaming_app/presentation/watch/widgets/video_vote_average.dart';

class MovieWatchPage extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieWatchPage({
    super.key,
    required this.movieEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(id: movieEntity.id!),
            SizedBox(height: 15),
            VideoTitle(title: movieEntity.title!),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoReleaseDate(releaseDate: movieEntity.releaseDate!),
                VideoVoteAverage(voteAverage: movieEntity.voteAverage!),
              ],
            ),
            SizedBox(height: 15),
            VideoOverview(overview: movieEntity.overview!),
            SizedBox(height: 15),
            RecommendationMovies(movieId: movieEntity.id!),
            SizedBox(height: 15),
            SimilarMovies(movieId: movieEntity.id!),
          ],
        ),
      ),
    );
  }
}
