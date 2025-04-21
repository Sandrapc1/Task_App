import 'package:flutter/material.dart';

class MyData {
  static const String imageUrl = 'https://tinyurl.com/3hfa26cx';
  static const Map<String, List<Color>> colors = {
    'Red': [Colors.redAccent, Colors.red],
    'Green': [Colors.greenAccent, Colors.green],
    'Blue': [Colors.blueAccent, Colors.blue],
    'Purple': [Colors.purpleAccent, Colors.purple],
    'Yellow': [Colors.yellowAccent, Colors.yellow],
  };
  static const Map<String, Duration> speeds = {
    'Slow': Duration(seconds: 10),
    'Medium': Duration(seconds: 5),
    'High': Duration(seconds: 2),
  };
}