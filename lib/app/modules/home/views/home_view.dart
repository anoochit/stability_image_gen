import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../services/stability_service.dart';
import '../../../views/views/image_thumbnail_blank_view.dart';
import '../../../views/views/image_thumbnail_error_view.dart';
import '../../../views/views/image_thumbnail_processing_view.dart';
import '../../../views/views/image_thumbnail_view.dart';
import '../../../views/views/input_box_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stability Image Gen'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // prompt
            InputBoxView(),
            GetBuilder<HomeController>(
                init: HomeController(),
                builder: (controller) {
                  return (controller.prompt.trim().isNotEmpty)
                      ? FutureBuilder(
                          future: StabilityService.generateImage(
                            prompt: controller.prompt.value,
                          ),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ImageThumbnailErrorView(
                                    error: '${snapshot.error}'),
                              );
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: ImageThumbnailProcessingView(),
                              );
                            }

                            if (snapshot.hasData) {
                              final data = snapshot.data;
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ImageThumbnailView(data: data!),
                              );
                            }

                            return Container();
                          },
                        )
                      : const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ImageThumbnailBlankView(),
                        );
                }),
          ],
        ),
      ),
    );
  }
}
