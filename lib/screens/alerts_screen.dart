import 'package:flutter/material.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF213EA7),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Stay informed about your energy usage',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Alerts
          _buildAlertCard(
            icon: Icons.flash_on,
            iconColor: const Color(0xFFFFA041),
            bgColor: const Color(0xFFFFA041).withOpacity(0.1),
            title: 'High Energy Usage Alert',
            description: 'Your AC is consuming more than usual.',
            time: '2 hours ago',
            actionable: true,
          ),
          const SizedBox(height: 12),
          _buildAlertCard(
            icon: Icons.eco,
            iconColor: Colors.green,
            bgColor: Colors.green.withOpacity(0.1),
            title: 'Eco-Friendly Achievement',
            description: 'You saved 15% energy this week!',
            time: '1 day ago',
            actionable: false,
          ),
          const SizedBox(height: 12),
          _buildAlertCard(
            icon: Icons.cloud_outlined,
            iconColor: const Color(0xFF213EA7),
            bgColor: const Color(0xFF213EA7).withOpacity(0.1),
            title: 'Device Offline',
            description: 'Living Room Light is offline.',
            time: '3 days ago',
            actionable: true,
          ),
          const SizedBox(height: 12),
          _buildAlertCard(
            icon: Icons.info_outline,
            iconColor: Colors.blue,
            bgColor: Colors.blue.withOpacity(0.1),
            title: 'Monthly Report Ready',
            description: 'Your energy report for December is ready.',
            time: '5 days ago',
            actionable: false,
          ),
          const SizedBox(height: 12),
          _buildAlertCard(
            icon: Icons.lightbulb_outline,
            iconColor: const Color(0xFFFFA041),
            bgColor: const Color(0xFFFFA041).withOpacity(0.1),
            title: 'Energy Saving Tips',
            description: 'Reduce AC usage to save more energy.',
            time: '1 week ago',
            actionable: false,
          ),

          const SizedBox(height: 24),

          // Clear All Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                side: const BorderSide(color: Color(0xFFE6F0FF), width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('All notifications cleared')),
                );
              },
              child: const Text(
                'Clear All Notifications',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF213EA7),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertCard({
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    required String title,
    required String description,
    required String time,
    required bool actionable,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE6F0FF)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
              if (actionable)
                Icon(Icons.chevron_right, color: Colors.grey[400], size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
