import 'package:flutter/material.dart';
import '../models/device.dart';
import '../models/chart_data.dart';

class AppConstants {
  static const String primaryColor = '0xFF213EA7';
  static const String accentColor = '0xFFFFA041';

  static final List<Device> devices = [
    Device(
      id: 1,
      name: 'Living Room Light',
      type: 'Smart Light',
      icon: Icons.lightbulb_outlined,
      color: const Color(0xFFFFA041),
      bgColor: const Color(0xFFFFA041).withOpacity(0.2),
      currentUsage: '0.36',
      todayUsage: 2.5,
      isOn: true,
      brightness: 75,
    ),
    Device(
      id: 2,
      name: 'Bedroom AC',
      type: 'Air Conditioner',
      icon: Icons.cloud_outlined,
      color: const Color(0xFF213EA7),
      bgColor: const Color(0xFF213EA7).withOpacity(0.1),
      currentUsage: '1.2',
      todayUsage: 8.2,
      isOn: true,
      temperature: 24,
    ),
    Device(
      id: 3,
      name: 'Refrigerator',
      type: 'Kitchen Appliance',
      icon: Icons.kitchen_outlined,
      color: Colors.purple,
      bgColor: Colors.purple.withOpacity(0.1),
      currentUsage: '0.25',
      todayUsage: 1.8,
      isOn: true,
    ),
  ];

  static final List<WeeklyData> weeklyData = [
    WeeklyData(day: 'Mon', energy: 15),
    WeeklyData(day: 'Tue', energy: 18),
    WeeklyData(day: 'Wed', energy: 12),
    WeeklyData(day: 'Thu', energy: 16),
    WeeklyData(day: 'Fri', energy: 14),
    WeeklyData(day: 'Sat', energy: 10),
    WeeklyData(day: 'Sun', energy: 12.5),
  ];

  static final List<MonthlyData> monthlyData = [
    MonthlyData(month: 'Jan', energy: 380),
    MonthlyData(month: 'Feb', energy: 340),
    MonthlyData(month: 'Mar', energy: 360),
    MonthlyData(month: 'Apr', energy: 320),
    MonthlyData(month: 'May', energy: 310),
    MonthlyData(month: 'Jun', energy: 325),
  ];

  static final List<DeviceConsumption> deviceConsumption = [
    DeviceConsumption(device: 'AC', percentage: 65, energy: 210),
    DeviceConsumption(device: 'Lights', percentage: 15, energy: 48),
    DeviceConsumption(device: 'Refrigerator', percentage: 12, energy: 39),
    DeviceConsumption(device: 'Others', percentage: 8, energy: 28),
  ];
}
