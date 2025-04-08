import 'dart:async'; // Add this import for Timer

import 'package:flutter/material.dart';
import 'package:project/routes.dart';

import 'Components/eventcard.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List<String> images = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.jpg',
    'assets/image5.jpeg',
  ];

  final PageController controller = PageController();
  int currentIndex = 0;
  late Timer _timer; // Timer for auto-scrolling

  @override
  void initState() {
    super.initState();
    // Start auto-scrolling when widget initializes
    _startAutoScroll();
  }

  @override
  void dispose() {
    // Cancel the timer when widget is disposed
    _timer.cancel();
    controller.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    // Auto-scroll every 3 seconds
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (controller.hasClients) {
        final nextPage = currentIndex + 1;
        if (nextPage >= images.length) {
          controller.jumpToPage(0); // Loop back to first image
        } else {
          controller.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "EventMate",
          style: TextStyle(
              color: Colors.white70,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Raleway'),
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF24294b),
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFFD4AF37),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Color(0xFF24294b),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Color(0xFFD4AF37),
                      size: 40,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "Profile",
                    style: TextStyle(
                      color: Color(0xFF24294b),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home_outlined,
                color: Color(0xFFD4AF37),
              ),
              title: Text(
                "HOME",
                style: TextStyle(
                    color: Color(0xFFD4AF37),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.home);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.event_note_outlined,
                color: Color(0xFFD4AF37),
              ),
              title: Text(
                "EVENTS",
                style: TextStyle(
                    color: Color(0xFFD4AF37),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.events);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.book_online_outlined,
                color: Color(0xFFD4AF37),
              ),
              title: Text(
                "BOOK NOW",
                style: TextStyle(
                    color: Color(0xFFD4AF37),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.booknow);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings_outlined,
                color: Color(0xFFD4AF37),
              ),
              title: Text(
                "SETTINGS",
                style: TextStyle(
                    color: Color(0xFFD4AF37),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.settings);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.feedback_outlined,
                color: Color(0xFFD4AF37),
              ),
              title: Text(
                "FEEDBACK",
                style: TextStyle(
                    color: Color(0xFFD4AF37),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.feedback);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.contact_support_outlined,
                color: Color(0xFFD4AF37),
              ),
              title: Text(
                "CONTACTS",
                style: TextStyle(
                    color: Color(0xFFD4AF37),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.contact);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Color(0xFFD4AF37),
              ),
              title: Text(
                "LOG OUT",
                style: TextStyle(
                    color: Color(0xFFD4AF37),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Image Carousel
            Column(
              children: [
                Text(
                  "Your Next Big Memory, Starts Here",
                  style: TextStyle(
                    fontFamily: 'Gill Sans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFFD4AF37),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 220,
              width: double.infinity,
              child: PageView.builder(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index % images.length;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        images[index % images.length],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < images.length; i++)
                  buildIndicator(currentIndex == i)
              ],
            ),
            Container(
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => controller.jumpToPage(currentIndex - 1),
                    child: const Icon(Icons.arrow_back, color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () => controller.jumpToPage(currentIndex + 1),
                    child: const Icon(Icons.arrow_forward, color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Upcoming Events',
                  style: TextStyle(
                    color: Color(0xFF24294b),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Event Cards in a grid

            GridView.count(
              shrinkWrap: true,
              // <-- Important for scrolling
              physics: const NeverScrollableScrollPhysics(),
              // <-- Let parent handle scrolling
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                EventCard(
                  title: 'Music Festival',
                  date: 'June 15, 2025',
                  imageUrl: 'assets/event1.png',
                  onTap: () => Navigator.pushNamed(context, AppRoutes.booknow),
                ),
                EventCard(
                  title: 'Food Festival',
                  date: 'April 22, 2025',
                  imageUrl: 'assets/event2.jpg',
                  onTap: () => Navigator.pushNamed(context, AppRoutes.booknow),
                ),
                EventCard(
                  title: 'Business Meetup',
                  date: 'May 22, 2025',
                  imageUrl: 'assets/event3.jpg',
                  onTap: () => Navigator.pushNamed(context, AppRoutes.booknow),
                ),
                EventCard(
                  title: 'Corporate Event',
                  date: 'May 28, 2025',
                  imageUrl: 'assets/event4.jpg',
                  onTap: () => Navigator.pushNamed(context, AppRoutes.booknow),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator(bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        height: isSelected ? 12 : 10,
        width: isSelected ? 12 : 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}
