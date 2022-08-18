import 'package:flutter/material.dart';
import 'package:imdb_sample/common/resources/colors.dart';
import 'package:imdb_sample/common/resources/paddings.dart';

class LoadingOverlay {
  OverlayEntry? _overlay;

  LoadingOverlay();

  void show(BuildContext context) {
    if (_overlay == null) {
      _overlay = OverlayEntry(
        builder: (context) => Container(
          width: ImdbPaddings(context).screenWidth * 0.25,
          height: ImdbPaddings(context).screenWidth * 0.25,
          decoration: BoxDecoration(
            color: ImdbColors.primaryBlack.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Center(
            child: CircularProgressIndicator(color: ImdbColors.primaryOrange),
          ),
        ),
      );
      Overlay.of(context)?.insert(_overlay!);
    }
  }

  void hide() {
    if (_overlay != null) {
      _overlay?.remove();
      _overlay = null;
    }
  }
}
