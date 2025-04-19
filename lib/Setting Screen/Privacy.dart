import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF24294b),
      body: CustomScrollView(
        slivers: [
          // Custom app bar with back button only
          SliverAppBar(
            backgroundColor: const Color(0xFF24294b),
            elevation: 0,
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFFD4AF37)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            expandedHeight: 120,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Privacy Policy',
                style: TextStyle(
                  color: const Color(0xFFD4AF37),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Container(
                color: const Color(0xFF24294b),
              ),
            ),
          ),

          // Privacy policy content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // App Logo/Header
                  Center(
                    child: Column(
                      children: [
                        const Icon(
                          Icons.security,
                          size: 60,
                          color: Color(0xFFD4AF37),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Your Privacy Matters',
                          style: TextStyle(
                            color: const Color(0xFFD4AF37),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Privacy Policy Sections
                  _buildSection(
                    '🔒 Data Collection',
                    'We collect minimal personal data required for app functionality. This includes:',
                    const [
                      '• Account information (email, username)',
                      '• Device information for analytics',
                      '• Usage data to improve our services'
                    ],
                  ),

                  const SizedBox(height: 25),

                  _buildSection(
                    '📊 Data Usage',
                    'Your data is used for:',
                    const [
                      '• Providing and improving our services',
                      '• Personalizing your experience',
                      '• Analytics and performance metrics'
                    ],
                  ),

                  const SizedBox(height: 25),

                  _buildSection(
                    '🛡️ Data Protection',
                    'We implement strong security measures:',
                    const [
                      '• Encryption of sensitive data',
                      '• Regular security audits',
                      '• Limited access to personal information'
                    ],
                  ),

                  const SizedBox(height: 25),

                  _buildSection(
                    '🌐 Third Parties',
                    'We may share data with:',
                    const [
                      '• Service providers (hosting, analytics)',
                      '• Legal authorities when required',
                      '• Business partners (with your consent)'
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Contact Information
                  Center(
                    child: Column(
                      children: [
                        Text(
                          '📧 Contact Us',
                          style: TextStyle(
                            color: const Color(0xFFD4AF37),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'abbishal25@gmail.com',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Last Updated: ${DateTime.now().toString().substring(0, 10)}',
                          style: TextStyle(
                            color: const Color(0xFFD4AF37).withOpacity(0.7),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String description, List<String> points) {
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
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: points
              .map((point) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      point,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
