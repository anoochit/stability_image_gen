import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ImageThumbnailProcessingView extends GetView {
  const ImageThumbnailProcessingView({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.width,
      child: const Center(
        child: Text('Processing...'),
      ),
    );
  }
}
