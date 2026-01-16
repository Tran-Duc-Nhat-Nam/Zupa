import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

abstract class AppPhotoView {
  static Future<dynamic> showPhotoView(
    BuildContext context,
    ImageProvider imageProvider,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: PhotoView(
            tightMode: true,
            imageProvider: imageProvider,
            heroAttributes: const .new(tag: 'someTag'),
            disableGestures: true,
            backgroundDecoration: const .new(color: Colors.transparent),
          ),
        );
      },
    );
  }
}
