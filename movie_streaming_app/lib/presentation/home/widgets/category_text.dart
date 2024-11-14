import 'package:flutter/material.dart';
import 'package:movie_streaming_app/common/widgets/text_widget.dart';

class CategoryText extends StatelessWidget {
  final String title;
  const CategoryText({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 12),
      child: Label(
        label: title,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}
