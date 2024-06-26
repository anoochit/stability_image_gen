import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stability_image_gen/app/modules/home/controllers/home_controller.dart';

class InputBoxView extends GetView<HomeController> {
  InputBoxView({super.key});

  final textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          hintText: 'Enter your prompt here...',
          suffixIcon: IconButton(
            onPressed: () {
              controller.prompt.value = textEditingController.text.trim();
              controller.update();
            },
            icon: const Icon(Icons.send),
          ),
        ),
        maxLines: null,
      ),
    );
  }
}
