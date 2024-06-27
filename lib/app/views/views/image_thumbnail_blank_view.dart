import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageThumbnailBlankView extends GetView {
  const ImageThumbnailBlankView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: const Center(
        child: Text('Please enter prompt to generate image'),
      ),
    );
  }
}
