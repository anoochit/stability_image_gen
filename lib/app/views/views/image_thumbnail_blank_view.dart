import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ImageThumbnailBlankView extends GetView {
  const ImageThumbnailBlankView({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.width,
      child: const Center(
        child: Text('Please enter prompt to generate image'),
      ),
    );
  }
}
