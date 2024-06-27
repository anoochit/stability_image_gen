import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageThumbnailView extends GetView {
  const ImageThumbnailView({super.key, required this.data});

  final Uint8List data;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
      child: Image.memory(
        data,
        width: Get.width,
        height: Get.width,
        fit: BoxFit.cover,
      ),
    );
  }
}
