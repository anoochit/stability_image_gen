import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ImageThumbnailErrorView extends GetView {
  const ImageThumbnailErrorView({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.width,
      child: Center(
        child: Text(error),
      ),
    );
  }
}
