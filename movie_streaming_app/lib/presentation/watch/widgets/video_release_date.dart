import 'package:flutter/material.dart';
import 'package:movie_streaming_app/common/widgets/text_widget.dart';

class VideoReleaseDate extends StatelessWidget {
  final DateTime releaseDate;
  const VideoReleaseDate({
    super.key,
    required this.releaseDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.calendar_month,
          size: 20,
          color: Colors.grey,
        ),
        Label(
          label: '  ${releaseDate.toString().split(' ')[0]}',
          fontSize: 12,
          color: Colors.grey,
        ),
      ],
    );
  }
}
