import 'package:flutter/material.dart';
import 'package:project/routes.dart';

import 'Components/eventcard.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFD4AF37)),
        title: const Text(
          'Events',
          style: TextStyle(color: Color(0xFFD4AF37)),
        ),
      ),
      body: Scrollbar(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Add outer padding
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8, // Adjust this ratio as needed
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
            ),
            itemCount: 8, // Number of items
            itemBuilder: (context, index) {
              // Create a list of all your events
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

                // Add all other events...
              ];

              return EventCard(
                title: events[index]['title']!,
                date: events[index]['date']!,
                imageUrl: events[index]['image']!,
                onTap: () => Navigator.pushNamed(context, AppRoutes.booknow),
              );
            },
          ),
        ),
      ),
    );
  }
}
