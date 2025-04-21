// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../controller/app_controller.dart';
// import '../../data/my_data.dart';

// class ProgressBar extends StatelessWidget {
//   final AppController controller;

//   const ProgressBar({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: controller.animationController,
//       builder: (context, _) {
//         return Container(
//           width: 300,
//           height: 20,
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.white54),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: Stack(
//               children: [
//                 Container(
//                   width: 300,
//                   height: 20,
//                   color: Colors.transparent,
//                 ),
//                 Obx(
//                   () => Container(
//                     width: 300 * controller.animationController!.value,
//                     height: 20,
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: MyData.colors[controller.selectedColor.value]!,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/app_controller.dart';
import '../../data/my_data.dart';

class ProgressBar extends StatelessWidget {
  final AppController controller;

  const ProgressBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.animationController,
      builder: (context, _) {
        return Container(
          width: 300,
          height: 20,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white54),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Container(
                  width: 300,
                  height: 20,
                  color: Colors.transparent,
                ),
                Obx(
                  () => Container(
                    width: 300 * (controller.isReversed.value
                        ? 1.0 - controller.animationController.value
                        : controller.animationController.value),
                    height: 20,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: MyData.colors[controller.selectedColor.value]!,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}