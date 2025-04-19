import 'package:flutter/material.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF24294b),
      body: CustomScrollView(
        slivers: [
          // Custom app bar with back button
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
                'Help Center',
                style: TextStyle(
                  color: const Color(0xFFD4AF37),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Container(
                color: const Color(0xFF24294b),
              ),
            ),
          ),

          // Help content sections
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Header with help icon
                    const Icon(
                      Icons.help_outline,
                      size: 60,
                      color: Color(0xFFD4AF37),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'How can we help you?',
                      style: TextStyle(
                        color: const Color(0xFFD4AF37),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Help topics
                    _buildHelpCard(
                      icon: Icons.account_circle,
                      title: 'Account Help',
                      items: const [
                        'How to create an account',
                        'Resetting your password',
                        'Updating profile information'
                      ],
                      context: context,
                    ),

                    const SizedBox(height: 20),

                    _buildHelpCard(
                      icon: Icons.settings,
                      title: 'App Settings',
                      items: const [
                        'Notification preferences',
                        'Dark mode settings',
                        'Language selection'
                      ],
                      context: context,
                    ),

                    const SizedBox(height: 20),

                    _buildHelpCard(
                      icon: Icons.payment,
                      title: 'Payments',
                      items: const [
                        'Setting up payment methods',
                        'Subscription management',
                        'Refund requests'
                      ],
                      context: context,
                    ),

                    const SizedBox(height: 20),

                    _buildHelpCard(
                      icon: Icons.security,
                      title: 'Privacy & Security',
                      items: const [
                        'Two-factor authentication',
                        'Data privacy settings',
                        'Reporting security issues'
                      ],
                      context: context,
                    ),

                    const SizedBox(height: 30),

                    // Contact support section
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1a1f3d),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFFD4AF37).withOpacity(0.3),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.support_agent,
                            size: 40,
                            color: Color(0xFFD4AF37),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Need more help?',
                            style: TextStyle(
                              color: const Color(0xFFD4AF37),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Our support team is available 24/7 to assist you with any issues.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () {
                              // Action for contact support
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFD4AF37),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              'Contact Support',
                              style: TextStyle(
                                color: Color(0xFF24294b),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'abbishal25@gmail.com',
                            style: TextStyle(
                              color: const Color(0xFFD4AF37),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpCard({
    required IconData icon,
    required String title,
    required List<String> items,
    required BuildContext context,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1a1f3d),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFD4AF37).withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: const Color(0xFFD4AF37),
                size: 28,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  color: const Color(0xFFD4AF37),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items
                .map((item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 4.0),
                            child: Icon(
                              Icons.circle,
                              size: 8,
                              color: Color(0xFFD4AF37),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              item,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
