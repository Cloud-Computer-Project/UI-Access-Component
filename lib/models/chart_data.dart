class WeeklyData {
  final String day;
  final double energy;

  WeeklyData({required this.day, required this.energy});
}

class MonthlyData {
  final String month;
  final double energy;

  MonthlyData({required this.month, required this.energy});
}

class DeviceConsumption {
  final String device;
  final double percentage;
  final double energy;

  DeviceConsumption({
    required this.device,
    required this.percentage,
    required this.energy,
  });
}
