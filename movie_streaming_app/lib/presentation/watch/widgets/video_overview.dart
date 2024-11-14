import 'package:flutter/material.dart';
import 'package:movie_streaming_app/common/widgets/text_widget.dart';

class VideoOverview extends StatelessWidget {
  final String overview;
  const VideoOverview({
    super.key,
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(
          label: 'Overview',
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        SizedBox(height: 10),
        Label(
          label: overview,
          fontSize: 14,
        ),
      ],
    );
  }
}
