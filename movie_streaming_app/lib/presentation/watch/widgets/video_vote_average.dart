import 'package:flutter/material.dart';
import 'package:movie_streaming_app/common/widgets/text_widget.dart';

class VideoVoteAverage extends StatelessWidget {
  final double voteAverage;
  const VideoVoteAverage({
    super.key,
    required this.voteAverage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 20,
        ),
        Label(
          label: '  ${voteAverage.toStringAsFixed(1)}',
          fontSize: 12,
        ),
      ],
    );
  }
}
