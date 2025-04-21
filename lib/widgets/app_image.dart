import 'package:flutter/material.dart';
import '../../data/my_data.dart';

class AppImage extends StatelessWidget {
  const AppImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      MyData.imageUrl,
      width: 200,
      height: 200,
      fit: BoxFit.cover,
    );
  }
}