import 'package:flutter/material.dart';
import 'package:movie_streaming_app/common/widgets/text_widget.dart';

class DisplayMessage {
  static void errorMessage(String message, BuildContext context) {
    var snackBar = SnackBar(
      content: Label(label: message),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
