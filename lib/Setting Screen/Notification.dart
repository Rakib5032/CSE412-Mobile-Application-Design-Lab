import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notifications',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NotificationsPage(),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF24294b),
      appBar: AppBar(
        backgroundColor: const Color(0xFF24294b),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFD4AF37)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Center( // Centered title
          child: Text(
            'Notifications',
            style: TextStyle(
              color: const Color(0xFFD4AF37),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildNotificationSection(
            title: 'Today',
            notifications: [
              _buildNotificationItem(
                icon: Icons.account_circle,
                title: 'Profile Update',
                message: 'Your profile picture was successfully updated',
                time: '2 hours ago',
                isRead: false,
              ),
              _buildNotificationItem(
                icon: Icons.payment,
                title: 'Payment Received',
                message: 'You received \$25.00 from John Doe',
                time: '4 hours ago',
                isRead: true,
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildNotificationSection(
            title: 'Yesterday',
            notifications: [
              _buildNotificationItem(
                icon: Icons.security,
                title: 'Security Alert',
                message: 'New login detected from a new device',
                time: 'Yesterday, 11:30 AM',
                isRead: true,
              ),
              _buildNotificationItem(
                icon: Icons.notifications_active,
                title: 'Reminder',
                message: 'Your subscription will renew in 3 days',
                time: 'Yesterday, 9:15 AM',
                isRead: true,
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildNotificationSection(
            title: 'This Week',
            notifications: [
              _buildNotificationItem(
                icon: Icons.event,
                title: 'Event Invitation',
                message: 'You have been invited to the annual meetup',
                time: 'Monday, 2:45 PM',
                isRead: true,
              ),
              _buildNotificationItem(
                icon: Icons.star,
                title: 'Special Offer',
                message: 'Exclusive 20% discount for our premium users',
                time: 'Sunday, 10:20 AM',
                isRead: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationSection({
    required String title,
    required List<Widget> notifications,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: const Color(0xFFD4AF37),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Column(
          children: notifications,
        ),
      ],
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required String title,
    required String message,
    required String time,
    required bool isRead,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1a1f3d),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFD4AF37).withOpacity(isRead ? 0.1 : 0.3),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Leading notification alert icon
          Icon(
            Icons.notifications,
            color: isRead ? const Color(0xFFD4AF37).withOpacity(0.5) : const Color(0xFFD4AF37),
            size: 24,
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFD4AF37).withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: const Color(0xFFD4AF37),
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: const Color(0xFFD4AF37),
                        fontSize: 16,
                        fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: const Color(0xFFD4AF37).withOpacity(0.7),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          if (!isRead)
            Container(
              margin: const EdgeInsets.only(left: 8),
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Color(0xFFD4AF37),
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}