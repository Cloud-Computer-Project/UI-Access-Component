import 'package:flutter/material.dart';

class AchievementsDetailScreen extends StatelessWidget {
  final VoidCallback onBack;

  const AchievementsDetailScreen({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    final achievements = [
      {
        'icon': Icons.emoji_events,
        'color': const Color(0xFFFFA041),
        'bgColor': const Color(0xFFFFA041).withOpacity(0.1),
        'title': '7 Days Streak',
        'description': 'Monitored energy for 7 consecutive days',
        'date': 'Unlocked today',
      },
      {
        'icon': Icons.eco,
        'color': const Color(0xFF213EA7),
        'bgColor': const Color(0xFFE6F0FF),
        'title': '120 kg CO₂ Saved',
        'description': 'You saved 120 kg of CO₂ emissions',
        'date': 'Unlocked 3 days ago',
      },
      {
        'icon': Icons.flash_on,
        'color': const Color(0xFF213EA7),
        'bgColor': const Color(0xFFE6F0FF),
        'title': '450 kWh Saved',
        'description': 'Total energy savings milestone reached',
        'date': 'Unlocked 1 week ago',
      },
      {
        'icon': Icons.trending_down,
        'color': Colors.green,
        'bgColor': Colors.green.withOpacity(0.1),
        'title': '30% Reduction',
        'description': 'Reduced energy usage by 30% this month',
        'date': 'Unlocked 2 weeks ago',
      },
      {
        'icon': Icons.devices,
        'color': const Color(0xFF213EA7),
        'bgColor': const Color(0xFFE6F0FF),
        'title': 'Device Master',
        'description': 'Controlled all types of smart devices',
        'date': 'Unlocked 1 month ago',
      },
      {
        'icon': Icons.star,
        'color': Colors.amber,
        'bgColor': Colors.amber.withOpacity(0.1),
        'title': 'Eco Champion',
        'description': 'Maintained eco-friendly practices for 30 days',
        'date': 'Unlocked 2 months ago',
      },
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back Button
          Row(
            children: [
              GestureDetector(
                onTap: onBack,
                child: const Icon(
                  Icons.arrow_back,
                  color: Color(0xFF213EA7),
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Achievements',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF213EA7),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Overview
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF213EA7), Color(0xFF1E2E7F)],
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Text(
                  '6 of 10',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Achievements Unlocked',
                  style: TextStyle(color: Colors.blue[200], fontSize: 14),
                ),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: 0.6,
                    minHeight: 8,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Achievements Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 2.0,
            ),
            itemCount: achievements.length,
            itemBuilder: (context, index) {
              final achievement = achievements[index];
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
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: achievement['bgColor'] as Color,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        achievement['icon'] as IconData,
                        color: achievement['color'] as Color,
                        size: 20,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      achievement['title'] as String,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      achievement['description'] as String,
                      style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Text(
                      achievement['date'] as String,
                      style: TextStyle(fontSize: 9, color: Colors.grey[500]),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
