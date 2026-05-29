import 'package:get/get.dart';

class AppController extends GetxController {
  final width = 0.0.obs;
  final height = 0.0.obs;
  final devType = 'Mobile'.obs;

  void setDimensions(double width, double height) {
    this.width.value = width;
    this.height.value = height;
    if (width > 1000) {
      devType.value = 'Desktop';
    } else if (width > 600) {
      devType.value = 'Tablet';
    } else {
      devType.value = 'Mobile';
    }
  }
}
