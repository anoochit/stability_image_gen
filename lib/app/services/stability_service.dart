import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';

class StabilityService {
  static const String baseUrl =
      "https://api.stability.ai/v2beta/stable-image/generate/core";
  static const String apiKey = String.fromEnvironment("STABILITY_APIKEY");

  static Future<Uint8List> generateImage({required String prompt}) async {
    const outputFormat = "webp";

    final headers = {
      "authorization": "Bearer $apiKey",
      "accept": "image/*",
    };

    final fields = {
      "prompt": prompt,
      "output_format": outputFormat,
    };

    final request = http.MultipartRequest("POST", Uri.parse(baseUrl));
    request.headers.addAll(headers);
    fields.forEach((key, value) => request.fields[key] = value);

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        // get image byte
        final bytes = await response.stream.toBytes();

        // save to image gallery
        await ImageGallerySaver.saveImage(bytes,
            name: '${DateTime.now().microsecondsSinceEpoch}.webp');

        return Uint8List.fromList(bytes);
      } else {
        throw ("Error: ${response.statusCode} ${response.reasonPhrase}");
      }
    } catch (error) {
      throw ("Error: $error");
    }
  }
}
