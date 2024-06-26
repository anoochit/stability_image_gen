import 'dart:developer';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

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

    log(headers.toString());

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
        final bytes = await response.stream.toBytes();
        return Uint8List.fromList(bytes);
      } else {
        throw ("Error: ${response.statusCode} ${response.reasonPhrase}");
      }
    } catch (error) {
      throw ("Error: $error");
    }
  }
}
