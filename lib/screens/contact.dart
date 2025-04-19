import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmergencyContact extends StatelessWidget {
  const EmergencyContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF24294b),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFD4AF37)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.call, color: Color(0xFFD4AF37), size: 24),
            SizedBox(width: 10),
            Flexible(
              child: Text(
                'Emergency Contact',
                style: TextStyle(
                  color: Color(0xFFD4AF37),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF24294b),
        elevation: 0,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: const Color(0xFFD4AF37),
            height: 1.0,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth:
                    constraints.maxWidth > 800 ? 800 : constraints.maxWidth,
              ),
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: [
                  _buildContactCard(
                    name: 'Bishal Biswas',
                    position: 'Project Manager',
                    phone: '+8801761896783',
                    email: 'biswas15-5394@diu.edu.bd',
                    studentId: '221-15-5394',
                    imagePath: 'assets/tm1.jpg',
                    context: context,
                  ),
                  const SizedBox(height: 8),
                  _buildContactCard(
                    name: 'Rakibul Haque Rabbi',
                    position: 'Head Developer',
                    phone: '+8801521797236',
                    email: 'rabbi15-5032@diu.edu.bd',
                    studentId: '221-15-5032',
                    imagePath: 'assets/tm2.jpg',
                    context: context,
                  ),
                  const SizedBox(height: 8),
                  _buildContactCard(
                    name: 'Md. Shadman Shani Pavel',
                    position: 'Structure Designer',
                    phone: '+8801533120838',
                    email: 'shani15-4836@diu.edu.bd',
                    studentId: '221-15-4836',
                    imagePath: 'assets/tm3.JPG',
                    context: context,
                  ),
                  const SizedBox(height: 8),
                  _buildContactCard(
                    name: 'Shahid Kaisar Apon',
                    position: 'Junior UI Designer',
                    phone: '+8801708957793',
                    email: 'apon15-5358@diu.edu.bd',
                    studentId: '221-15-5358',
                    imagePath: 'assets/tm4.JPG',
                    context: context,
                  ),
                  const SizedBox(height: 8),
                  _buildContactCard(
                    name: 'Seyam Sarker',
                    position: 'Q/A & Tester',
                    phone: '+8801643788962',
                    email: 'sarkar15-5795@diu.edu.bd',
                    studentId: '221-15-5795',
                    imagePath: 'assets/tm5.JPG',
                    context: context,
                  ),
                ]
                    .map((card) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: card,
                        ))
                    .toList(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContactCard({
    required String name,
    required String position,
    required String phone,
    required String email,
    required String studentId,
    required String imagePath,
    required BuildContext context,
  }) {
    return Card(
      color: const Color(0xFF3a3f68),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Profile Image
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[800],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.grey[800],
                      child: const Center(
                        child:
                            Icon(Icons.person, size: 40, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),

              // Contact Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Name and Position
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFFD4AF37),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          position,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white70,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'ID: $studentId',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white60,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Contact Details
                    Column(
                      children: [
                        _buildContactRow(
                          icon: Icons.phone,
                          text: phone,
                          onTap: () =>
                              _copyToClipboard(context, 'phone', phone),
                        ),
                        const SizedBox(height: 8),
                        _buildContactRow(
                          icon: Icons.email,
                          text: email,
                          onTap: () =>
                              _copyToClipboard(context, 'email', email),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactRow({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.white70),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 5),
          const Icon(Icons.content_copy, size: 16, color: Colors.white54),
        ],
      ),
    );
  }

  void _copyToClipboard(BuildContext context, String type, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied $type: $text'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
