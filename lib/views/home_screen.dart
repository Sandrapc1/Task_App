import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/app_controller.dart';
import '../core/color_dropdown.dart';
import '../widgets/app_image.dart';
import '../widgets/buttons.dart';
import '../widgets/progress_bar.dart';
import '../widgets/reverse_toggle.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  late final AppController controller;
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Default: Medium speed
    )..forward();
    controller = Get.put(AppController(animationController));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppImage(),
              const SizedBox(height: 20),
              const ColorDropdown(),
              const SizedBox(height: 20),
              const Buttons(),
              const SizedBox(height: 20),
              ProgressBar(controller: controller),
              const SizedBox(height: 20),
              _buildTextField(
                'Total Items',
                controller.setTotalItems,
                controller.totalItems.value.toString(),
              ),
              const SizedBox(height: 20),
              _buildTextField(
                'Items in Line',
                controller.setItemsInLine,
                controller.itemsInLine.value.toString(),
              ),
              const SizedBox(height: 20),
              const ReverseToggle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, Function(String) onChanged, String initialValue) {
    return SizedBox(
      width: 200,
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white70),
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white54),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        keyboardType: TextInputType.number,
        onChanged: onChanged,
        controller: TextEditingController(text: initialValue),
      ),
    );
  }
}