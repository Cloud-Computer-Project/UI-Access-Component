import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatefulWidget {
  final VoidCallback onBack;

  const NotificationSettingsScreen({super.key, required this.onBack});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool _highEnergyAlerts = true;
  bool _dailyReport = true;
  bool _deviceOfflineAlerts = false;
  bool _achievementNotifications = true;
  bool _promotionalEmails = false;

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
                'Notification Settings',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF213EA7),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Alert Notifications
          Text(
            'Alert Notifications',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 12),
          _buildNotificationItem(
            title: 'High Energy Usage Alerts',
            subtitle: 'Get notified when energy usage is unusually high',
            value: _highEnergyAlerts,
            onChanged: (value) {
              setState(() => _highEnergyAlerts = value);
            },
          ),
          const SizedBox(height: 12),
          _buildNotificationItem(
            title: 'Device Offline Alerts',
            subtitle: 'Get notified when a device goes offline',
            value: _deviceOfflineAlerts,
            onChanged: (value) {
              setState(() => _deviceOfflineAlerts = value);
            },
          ),
          const SizedBox(height: 24),

          // Reports
          Text(
            'Reports',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 12),
          _buildNotificationItem(
            title: 'Daily Energy Report',
            subtitle: 'Receive a summary of your daily energy usage',
            value: _dailyReport,
            onChanged: (value) {
              setState(() => _dailyReport = value);
            },
          ),
          const SizedBox(height: 24),

          // Achievements
          Text(
            'Achievements',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 12),
          _buildNotificationItem(
            title: 'Achievement Notifications',
            subtitle: 'Get notified when you unlock new achievements',
            value: _achievementNotifications,
            onChanged: (value) {
              setState(() => _achievementNotifications = value);
            },
          ),
          const SizedBox(height: 24),

          // Promotional
          Text(
            'Promotional',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 12),
          _buildNotificationItem(
            title: 'Promotional Emails',
            subtitle: 'Receive special offers and promotions',
            value: _promotionalEmails,
            onChanged: (value) {
              setState(() => _promotionalEmails = value);
            },
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
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Notification settings updated')),
                );
                widget.onBack();
              },
              child: const Text(
                'Save Preferences',
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

  Widget _buildNotificationItem({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE6F0FF)),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
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
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF213EA7),
          ),
        ],
      ),
    );
  }
}
