import 'package:flutter/material.dart';
import 'package:movie_streaming_app/common/widgets/app_bar.dart';
import 'package:movie_streaming_app/domain/tv/entities/tv_entity.dart';
import 'package:movie_streaming_app/presentation/watch/widgets/recommendation_tvs.dart';
import 'package:movie_streaming_app/presentation/watch/widgets/similar_tvs.dart';
import 'package:movie_streaming_app/presentation/watch/widgets/tv_keywords.dart';
import 'package:movie_streaming_app/presentation/watch/widgets/video_overview.dart';
import 'package:movie_streaming_app/presentation/watch/widgets/video_player.dart';
import 'package:movie_streaming_app/presentation/watch/widgets/video_title.dart';
import 'package:movie_streaming_app/presentation/watch/widgets/video_vote_average.dart';

class TVWatchPage extends StatelessWidget {
  final TVEntity tvEntity;
  const TVWatchPage({
    super.key,
    required this.tvEntity,
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
            VideoPlayer(id: tvEntity.id!),
            SizedBox(height: 15),
            VideoTitle(title: tvEntity.name!),
            SizedBox(height: 15),
            TVKeywords(tvId: tvEntity.id!),
            SizedBox(height: 15),
            VideoVoteAverage(voteAverage: tvEntity.voteAverage!),
            SizedBox(height: 15),
            VideoOverview(overview: tvEntity.overview!),
            SizedBox(height: 15),
            RecommendationTVs(tvId: tvEntity.id!),
            SizedBox(height: 15),
            SimilarTVs(tvId: tvEntity.id!),
          ],
        ),
      ),
    );
  }
}
