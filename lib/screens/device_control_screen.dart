import 'package:flutter/material.dart';
import '../models/device.dart';

class DeviceControlScreen extends StatefulWidget {
  final Device device;
  final VoidCallback onBack;

  const DeviceControlScreen({
    super.key,
    required this.device,
    required this.onBack,
  });

  @override
  State<DeviceControlScreen> createState() => _DeviceControlScreenState();
}

class _DeviceControlScreenState extends State<DeviceControlScreen> {
  late Device device;

  @override
  void initState() {
    super.initState();
    device = widget.device;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back Button
          Row(
            children: [
              GestureDetector(
                onTap: widget.onBack,
                child: const Icon(Icons.arrow_back,
                    color: Color(0xFF213EA7), size: 24),
              ),
              const SizedBox(width: 12),
              const Text(
                'Device Control',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF213EA7),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Device Icon
          Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: device.bgColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(device.icon, color: device.color, size: 50),
            ),
          ),
          const SizedBox(height: 24),

          // Device Name
          Center(
            child: Column(
              children: [
                Text(
                  device.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  device.type,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Current Usage
          Text(
            'Current Usage',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: device.bgColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: device.color.withOpacity(0.3)),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Power',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  '${device.currentUsage} W',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: device.color,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Today's Usage
          Text(
            'Today\'s Energy Usage',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE6F0FF)),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Energy',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  '${device.todayUsage} kWh',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF213EA7),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Controls
          if (device.brightness != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Brightness',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: device.brightness!,
                        onChanged: (value) {
                          setState(() {
                            device.brightness = value;
                          });
                        },
                        min: 0,
                        max: 100,
                        activeColor: const Color(0xFFFFA041),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '${device.brightness!.toInt()}%',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          if (device.temperature != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Temperature',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: device.temperature!,
                        onChanged: (value) {
                          setState(() {
                            device.temperature = value;
                          });
                        },
                        min: 16,
                        max: 32,
                        activeColor: const Color(0xFF213EA7),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '${device.temperature!.toInt()}°C',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),

          // On/Off Toggle
          Row(
            children: [
              Expanded(
                child: Text(
                  device.isOn ? 'Device is ON' : 'Device is OFF',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              Switch(
                value: device.isOn,
                onChanged: (value) {
                  setState(() {
                    device.isOn = value;
                  });
                },
                activeColor: const Color(0xFF213EA7),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Save Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF213EA7),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: widget.onBack,
              child: const Text(
                'Save & Close',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
