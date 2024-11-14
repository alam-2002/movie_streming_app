import 'package:flutter/material.dart';
import 'package:movie_streaming_app/common/widgets/text_widget.dart';
import 'package:movie_streaming_app/core/configs/theme/app_colors.dart';

class SelectableOption extends StatelessWidget {
  final String title;
  final bool isSelected;
  final void Function() onTap;
  const SelectableOption({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? AppColors.primary : AppColors.secondBackground,
        ),
        child: Center(
          child: Label(label: title),
        ),
      ),
    );
  }
}
