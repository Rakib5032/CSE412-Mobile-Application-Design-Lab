import 'package:flutter/material.dart';

void main() {
  runApp(const AdminPanelApp());
}

class AdminPanelApp extends StatelessWidget {
  const AdminPanelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EventMate Admin',
      theme: ThemeData(
        primaryColor: const Color(0xFF24294b),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFFD4AF37),
        ),
      ),
      home: const AdminHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(),
    const EventManagementPage(),
    const UserManagementPage(),
    const AnalyticsPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF24294b),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'EventMate Admin',
            style: TextStyle(
              color: Color(0xFFD4AF37),
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF24294b),
        iconTheme: const IconThemeData(color: Color(0xFFD4AF37)),
      ),
      drawer: _buildDrawer(),
      body: _pages[_currentIndex],
      floatingActionButton: _currentIndex == 1
          ? FloatingActionButton(
        onPressed: () => _showAddEventDialog(context),
        backgroundColor: const Color(0xFFD4AF37),
        child: const Icon(Icons.add),
      )
          : null,
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      backgroundColor: const Color(0xFF24294b),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFFD4AF37),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Color(0xFF24294b)),
                ),
                SizedBox(height: 10),
                Text(
                  'Admin',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'admin@eventmate.com',
                  style: TextStyle(color: Colors.black87),
                ),
              ],
            ),
          ),
          _buildDrawerItem(Icons.dashboard, 'Dashboard', 0),
          _buildDrawerItem(Icons.event, 'Events', 1),
          _buildDrawerItem(Icons.people, 'Users', 2),
          _buildDrawerItem(Icons.analytics, 'Analytics', 3),
          _buildDrawerItem(Icons.settings, 'Settings', 4),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(IconData icon, String title, int index) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFFD4AF37)),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      selected: _currentIndex == index,
      onTap: () {
        setState(() => _currentIndex = index);
        Navigator.pop(context);
      },
    );
  }

  void _showAddEventDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF24294b),
        title: const Text(
          'Add New Event',
          style: TextStyle(color: Color(0xFFD4AF37)),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Event Name',
                labelStyle: const TextStyle(color: Color(0xFFD4AF37)),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFD4AF37)),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Date',
                labelStyle: const TextStyle(color: Color(0xFFD4AF37)),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFD4AF37)),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Color(0xFFD4AF37)),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Event added successfully'),
                  backgroundColor: Color(0xFFD4AF37),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD4AF37),
            ),
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              _buildSummaryCard('Total Events', '24', Icons.event),
              const SizedBox(width: 16),
              _buildSummaryCard('Active Users', '156', Icons.people),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildSummaryCard('Upcoming Events', '5', Icons.calendar_today),
              const SizedBox(width: 16),
              _buildSummaryCard('Revenue', '\$2,450', Icons.attach_money),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Quick Actions',
            style: TextStyle(
              color: Color(0xFFD4AF37),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _buildQuickAction(Icons.add, 'Add Event', () => _showAddEventDialog(context)),
              _buildQuickAction(Icons.person_add, 'Add User', () {}),
              _buildQuickAction(Icons.report, 'Generate Report', () {}),
              _buildQuickAction(Icons.settings, 'Settings', () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1a1f3d),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFD4AF37).withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(icon, color: const Color(0xFFD4AF37), size: 24),
                const SizedBox(width: 8),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAction(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF1a1f3d),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(icon, color: const Color(0xFFD4AF37), size: 30),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _showAddEventDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF24294b),
        title: const Text(
          'Add New Event',
          style: TextStyle(color: Color(0xFFD4AF37)),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Event Name',
                labelStyle: const TextStyle(color: Color(0xFFD4AF37)),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFD4AF37)),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Date',
                labelStyle: const TextStyle(color: Color(0xFFD4AF37)),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFD4AF37)),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Color(0xFFD4AF37)),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Event added successfully'),
                  backgroundColor: Color(0xFFD4AF37),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD4AF37),
            ),
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}

class EventManagementPage extends StatelessWidget {
  const EventManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Search Events',
              labelStyle: const TextStyle(color: Color(0xFFD4AF37)),
              prefixIcon: const Icon(Icons.search, color: Color(0xFFD4AF37)),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFD4AF37)),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFD4AF37), width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => _buildEventItem(index),
          ),
        ),
      ],
    );
  }

  Widget _buildEventItem(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1a1f3d),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: const Icon(Icons.event, color: Color(0xFFD4AF37)),
        title: Text(
          'Event ${index + 1}',
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          '2023-06-${10 + index}',
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Color(0xFFD4AF37)),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class UserManagementPage extends StatelessWidget {
  const UserManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Search Users',
                    labelStyle: const TextStyle(color: Color(0xFFD4AF37)),
                    prefixIcon: const Icon(Icons.search, color: Color(0xFFD4AF37)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFD4AF37)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFD4AF37), width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: const Icon(Icons.person_add, color: Color(0xFFD4AF37), size: 30),
                onPressed: () => _showAddUserDialog(context),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 15,
            itemBuilder: (context, index) => _buildUserItem(index),
          ),
        ),
      ],
    );
  }

  Widget _buildUserItem(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1a1f3d),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Color(0xFFD4AF37),
          child: Icon(Icons.person, color: Colors.black),
        ),
        title: Text(
          'User ${index + 1}',
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          'user${index + 1}@example.com',
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {},
        ),
      ),
    );
  }

  void _showAddUserDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF24294b),
        title: const Text(
          'Add New User',
          style: TextStyle(color: Color(0xFFD4AF37)),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: const TextStyle(color: Color(0xFFD4AF37)),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFD4AF37)),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: const TextStyle(color: Color(0xFFD4AF37)),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFD4AF37)),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Color(0xFFD4AF37)),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('User added successfully'),
                  backgroundColor: Color(0xFFD4AF37),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD4AF37),
            ),
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'Event Statistics',
            style: TextStyle(
              color: Color(0xFFD4AF37),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: const Color(0xFF1a1f3d),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFD4AF37).withOpacity(0.5)),
            ),
            child: Image.network(
              'https://images.unsplash.com/photo-1531058020387-3be344556be6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'User Engagement',
            style: TextStyle(
              color: Color(0xFFD4AF37),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: const Color(0xFF1a1f3d),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFD4AF37).withOpacity(0.5)),
            ),
            child: Image.network(
              'https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Admin Settings',
            style: TextStyle(
              color: Color(0xFFD4AF37),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _buildSettingsItem(Icons.security, 'Admin Privileges'),
          _buildSettingsItem(Icons.notifications, 'Notification Settings'),
          _buildSettingsItem(Icons.color_lens, 'Theme Customization'),
          _buildSettingsItem(Icons.help, 'Help & Support'),
          const SizedBox(height: 30),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD4AF37),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1a1f3d),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFFD4AF37)),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
        onTap: () {},
      ),
    );
  }
}