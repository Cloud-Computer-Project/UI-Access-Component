import 'package:flutter/material.dart';

enum DeviceType {
  light,
  ac,
  refrigerator,
  other,
}

class Device {
  final int id;
  final String name;
  final String type;
  final IconData icon;
  final Color color;
  final Color bgColor;
  final String currentUsage;
  final double todayUsage;
  bool isOn;
  double? brightness;
  double? temperature;

  Device({
    required this.id,
    required this.name,
    required this.type,
    required this.icon,
    required this.color,
    required this.bgColor,
    required this.currentUsage,
    required this.todayUsage,
    required this.isOn,
    this.brightness,
    this.temperature,
  });
}
