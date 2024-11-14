import 'package:flutter/material.dart';
import 'package:movie_streaming_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_streaming_app/common/widgets/text_widget.dart';
import 'package:movie_streaming_app/core/configs/assets/app_images.dart';
import 'package:movie_streaming_app/core/configs/theme/app_colors.dart';
import 'package:movie_streaming_app/domain/tv/entities/tv_entity.dart';
import 'package:movie_streaming_app/presentation/watch/pages/watch_tvs.dart';

class TVCard extends StatelessWidget {
  final TVEntity tvEntity;
  const TVCard({
    super.key,
    required this.tvEntity,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigator.push(context, TVWatchPage(tvEntity: tvEntity));
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      // AppImages.movieImageBasePath + tvEntity.posterPath!,
                      tvEntity.providePosterPath(),
                    ),
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Label(
                      label: tvEntity.name!,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.amber,
                        ),
                        Label(
                          label: ' ${tvEntity.voteAverage!.toStringAsFixed(1)}',
                          fontSize: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
