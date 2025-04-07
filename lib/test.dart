import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const EmergencyContactApp());
}

class EmergencyContactApp extends StatelessWidget {
  const EmergencyContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emergency Contacts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EmergencyContactPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class EmergencyContactPage extends StatelessWidget {
  const EmergencyContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF24294b),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFD4AF37)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.call, color: Color(0xFFD4AF37)),
            SizedBox(width: 10),
            Text(
              'Emergency Contact',
              style: TextStyle(
                color: Color(0xFFD4AF37),
                fontWeight: FontWeight.bold,
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
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildDesktopContactCard(
                name: 'Bishal Biswas',
                position: 'Project Manager',
                phone: '+8801761896783',
                email: 'biswas15-5394@diu.edu.bd',
                studentId: '221-15-5394',
                imageUrl:
                    'https://drive.google.com/uc?export=view&id=1zxuqQGwIcITBaIGpAdHNJSz95ZP_V4NL',
                context: context,
              ),
              const SizedBox(height: 16),
              _buildDesktopContactCard(
                name: 'Rakibul Haque Rabbi',
                position: 'Head Developer',
                phone: '+8801521797236',
                email: 'rabbi15-5032@diu.edu.bd',
                studentId: '221-15-5032',
                imageUrl:
                    'https://drive.google.com/uc?export=view&id=YOUR_GOOGLE_DRIVE_FILE_ID_2',
                context: context,
              ),
              const SizedBox(height: 16),
              _buildDesktopContactCard(
                name: 'Md. Shadman Shani Pavel',
                position: 'Structure Designer',
                phone: '+8801533120838',
                email: 'shani15-4836@diu.edu.bd',
                studentId: '221-15-4836',
                imageUrl:
                    'https://drive.google.com/uc?export=view&id=YOUR_GOOGLE_DRIVE_FILE_ID_3',
                context: context,
              ),
              const SizedBox(height: 16),
              _buildDesktopContactCard(
                name: 'Shahid Kaisar Apon',
                position: 'Junior UI Designer',
                phone: '+8801708957793',
                email: 'apon15-5358@diu.edu.bd',
                studentId: '221-15-5358',
                imageUrl:
                    'https://drive.google.com/uc?export=view&id=YOUR_GOOGLE_DRIVE_FILE_ID_4',
                context: context,
              ),
              const SizedBox(height: 16),
              _buildDesktopContactCard(
                name: 'Seyam Sarker',
                position: 'Q/A & Tester',
                phone: '+8801643788962',
                email: 'sarkar15-5795@diu.edu.bd',
                studentId: '221-15-5795',
                imageUrl: 'assets/images/image1.jpg',
                context: context,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopContactCard({
    required String name,
    required String position,
    required String phone,
    required String email,
    required String studentId,
    required String imageUrl,
    required BuildContext context,
  }) {
    return Card(
      color: const Color(0xFF3a3f68),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 120,
                    height: 120,
                    color: Colors.grey,
                    child:
                        const Icon(Icons.person, size: 60, color: Colors.white),
                  );
                },
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFFD4AF37),
                    ),
                  ),
                  Text(
                    position,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'ID: $studentId',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white60,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: phone));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Copied phone number: $phone'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.phone,
                            size: 18, color: Colors.white70),
                        const SizedBox(width: 10),
                        Text(
                          phone,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(Icons.content_copy,
                            size: 16, color: Colors.white54),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: email));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Copied email: $email'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.email,
                            size: 18, color: Colors.white70),
                        const SizedBox(width: 10),
                        Text(
                          email,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(Icons.content_copy,
                            size: 16, color: Colors.white54),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
