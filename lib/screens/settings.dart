import 'package:flutter/material.dart';

import 'login_or_register.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF24294b),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.settings, color: Color(0xFF24294b)),
            const SizedBox(width: 8),
            Text(
              'Settings',
              style: TextStyle(
                color: const Color(0xFF24294b),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFD4AF37),
        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF24294b).withOpacity(0.8),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            _buildListTile(
              icon: Icons.edit,
              title: 'Edit Profile',
              onTap: () {},
            ),
            _buildListTile(
              icon: Icons.lock,
              title: 'Change Password',
              onTap: () {},
            ),
            Divider(
              color: const Color(0xFFD4AF37).withOpacity(0.3),
              indent: 20,
              endIndent: 20,
            ),
            _buildListTile(
              icon: Icons.notifications,
              title: 'Notification',
              onTap: () {},
            ),
            _buildListTile(
              icon: Icons.security,
              title: 'Privacy',
              onTap: () {},
            ),
            _buildListTile(
              icon: Icons.help,
              title: 'Help',
              onTap: () {},
            ),
            Divider(
              color: const Color(0xFFD4AF37).withOpacity(0.3),
              indent: 20,
              endIndent: 20,
            ),
            _buildListTile(
              icon: Icons.exit_to_app,
              title: 'Logout',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const LoginOrRegisterPage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: const Color(0xFF24294b),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
            color: const Color(0xFFD4AF37).withOpacity(0.2), width: 1),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Icon(
                icon,
                color: const Color(0xFFD4AF37),
                size: 28,
              ),
              const SizedBox(width: 15),
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFFD4AF37),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.chevron_right,
                color: const Color(0xFF24294b),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
