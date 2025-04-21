import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/app_controller.dart';
import '../../data/my_data.dart';

class ColorDropdown extends StatelessWidget {
  const ColorDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController controller = Get.find();
    return Obx(
      () => DropdownButton<String>(
        value: controller.selectedColor.value,
        dropdownColor: Colors.black,
        style: const TextStyle(color: Colors.white),
        underline: Container(
          height: 2,
          color: Colors.white54,
        ),
        items: MyData.colors.keys.map((String color) {
          return DropdownMenuItem<String>(
            value: color,
            child: Text(color),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) {
            controller.setColor(value);
          }
        },
      ),
    );
  }
}