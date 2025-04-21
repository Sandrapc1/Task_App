import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/app_controller.dart';
import '../../data/my_data.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController controller = Get.find();
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: MyData.speeds.keys.map((speed) {
          bool isSelected = controller.selectedSpeed.value == speed;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? Colors.white : Colors.grey,
                foregroundColor: isSelected ? Colors.black : Colors.white,
              ),
              onPressed: () => controller.setSpeed(speed),
              child: Text(speed),
            ),
          );
        }).toList(),
      ),
    );
  }
}