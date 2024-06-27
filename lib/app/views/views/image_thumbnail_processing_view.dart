import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ImageThumbnailProcessingView extends GetView {
  const ImageThumbnailProcessingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Theme.of(context).colorScheme.primaryContainer,
      baseColor: Theme.of(context).colorScheme.primary,
      child: Container(
        width: Get.width,
        height: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: const Center(
          child: Text('Processing...'),
        ),
      ),
    );
  }
}
