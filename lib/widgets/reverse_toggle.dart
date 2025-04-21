import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/app_controller.dart';

class ReverseToggle extends StatelessWidget {
  const ReverseToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController controller = Get.find();
    return Obx(
      () => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: controller.isReversed.value ? Colors.white : Colors.grey,
          foregroundColor: controller.isReversed.value ? Colors.black : Colors.white,
        ),
        onPressed: controller.toggleReverse,
        child: const Text('Reverse'),
      ),
    );
  }
}