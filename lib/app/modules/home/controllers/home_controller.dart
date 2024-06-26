import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isProcessing = false.obs;
  RxString prompt = ''.obs;
}
