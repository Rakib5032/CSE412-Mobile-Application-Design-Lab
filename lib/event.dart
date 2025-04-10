import 'package:flutter/material.dart';
import 'package:project/routes.dart';

import 'Components/eventcard.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFFD4AF37)),
        title: const Text(
          'Events',
          style: TextStyle(color: Color(0xFFD4AF37)),
        ),
        backgroundColor: Color(0xFF24294b),
        elevation: 1,
      ),
      body: Column(
        children: [
          // Text Container with elegant styling
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
              border: Border.all(
                color: const Color(0xFFD4AF37).withOpacity(0.1),
                width: 1,
              ),
            ),
            child: const Text(
              "Your perfect event experience awaits"
              " Book your events",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF444444),
                fontFamily: 'Gill Sans',
                letterSpacing: 0.3,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Main scrollable content
          Expanded(
            child: Scrollbar(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    final events = [
                      {
                        'title': 'Wedding',
                        'date': 'Anytime, Anywhere',
                        'image': 'assets/event10.jpg',
                      },
                      {
                        'title': 'Birthday',
                        'date': 'Anytime, Anywhere',
                        'image': 'assets/event11.jpg',
                      },
                      {
                        'title': 'Home Party',
                        'date': 'Anytime, Anywhere',
                        'image': 'assets/event12.jpg',
                      },
                      {
                        'title': 'Picnic',
                        'date': 'Anytime, Anywhere',
                        'image': 'assets/event13.jpg',
                      },
                      {
                        'title': 'Music Festival',
                        'date': 'Anytime, Anywhere',
                        'image': 'assets/event1.png',
                      },
                      {
                        'title': 'Food Festival',
                        'date': 'Anytime',
                        'image': 'assets/event2.jpg',
                      },
                      {
                        'title': 'Business Meetup',
                        'date': 'Anytime',
                        'image': 'assets/event3.jpg',
                      },
                      {
                        'title': 'Corporate Events',
                        'date': 'Anytime',
                        'image': 'assets/event4.jpg',
                      },
                    ];

                    return EventCard(
                      title: events[index]['title']!,
                      date: events[index]['date']!,
                      imageUrl: events[index]['image']!,
                      onTap: () =>
                          Navigator.pushNamed(context, AppRoutes.booknow),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
