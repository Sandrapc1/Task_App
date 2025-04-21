import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/function/my_function.dart';
import '../data/my_data.dart';

class AppController extends GetxController {
  final MyFunctions _functions = MyFunctions();
  final RxString selectedColor = MyData.colors.keys.first.obs;
  final RxString selectedSpeed = MyData.speeds.keys.first.obs;
  final RxInt totalItems = 100.obs;
  final RxInt itemsInLine = 10.obs;
  final RxDouble progress = 0.0.obs;
  final RxBool isReversed = false.obs;
  final AnimationController animationController;

  AppController(this.animationController);

  @override
  void onInit() {
    super.onInit();
    ever(progress, (_) => updateAnimation());
    ever(isReversed, (_) => updateAnimation());
    updateProgress();
  }

  void setColor(String color) {
    selectedColor.value = color;
  }

  void setSpeed(String speed) {
    selectedSpeed.value = speed;
    _functions.updateAnimationDuration(
        MyData.speeds[speed]!, animationController);
    updateAnimation();
  }

  void setTotalItems(String value) {
    int? parsed = int.tryParse(value);
    if (parsed != null && parsed > 0) {
      totalItems.value = parsed;
      _functions.updateProgress(
          totalItems.value, itemsInLine.value, progress, isReversed);
    }
  }

  void setItemsInLine(String value) {
    int? parsed = int.tryParse(value);
    if (parsed != null && parsed > 0) {
      itemsInLine.value = parsed;
      _functions.updateProgress(
          totalItems.value, itemsInLine.value, progress, isReversed);
    }
  }

  void toggleReverse() {
    isReversed.value = !isReversed.value;
    _functions.toggleReverseAnimation(animationController, isReversed);
  }

  void updateProgress() {
    _functions.updateProgress(
        totalItems.value, itemsInLine.value, progress, isReversed);
  }

  void updateAnimation() {
    animationController
      ..stop()
      ..value = isReversed.value ? 1.0 - progress.value : progress.value;
    if (isReversed.value) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }
}
