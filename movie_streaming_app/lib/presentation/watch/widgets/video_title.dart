import 'package:flutter/material.dart';
import 'package:movie_streaming_app/common/widgets/text_widget.dart';

class VideoTitle extends StatelessWidget {
  final String title;
  const VideoTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Label(
      label: title,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
  }
}
