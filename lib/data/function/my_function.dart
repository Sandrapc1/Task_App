// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MyFunctions {
//   void updateAnimationDuration(Duration duration, AnimationController controller) {
//     controller.duration = duration;
//     if (controller.isAnimating) {
//       controller
//         ..stop()
//         ..forward();
//     }
//   }

//   void updateProgress(
//       int totalItems, int itemsInLine, RxDouble progress, RxBool isReversed) {
//     double newProgress = itemsInLine / totalItems;
//     progress.value = isReversed.value ? 1.0 - newProgress : newProgress;
//   }

//   void toggleReverseAnimation(
//       AnimationController controller, RxBool isReversed) {
//     if (controller.isAnimating) {
//       controller.stop();
//     }
//     controller.value = isReversed.value ? 1.0 - controller.value : controller.value;
//     controller.forward();
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFunctions {
  void updateAnimationDuration(Duration duration, AnimationController controller) {
    controller.duration = duration;
    if (controller.isAnimating) {
      controller
        ..stop()
        ..forward();
    }
  }

  void updateProgress(
      int totalItems, int itemsInLine, RxDouble progress, RxBool isReversed) {
    double newProgress = itemsInLine / totalItems;
    progress.value = isReversed.value ? 1.0 - newProgress : newProgress;
  }

  void toggleReverseAnimation(
      AnimationController controller, RxBool isReversed) {
    if (controller.isAnimating) {
      controller.stop();
    }
    // Adjust the controller value based on the reverse state
    controller.value = isReversed.value ? 1.0 - controller.value : controller.value;
    // Run the animation in the correct direction
    if (isReversed.value) {
      controller.reverse(); // Animate backward
    } else {
      controller.forward(); // Animate forward
    }
  }
}