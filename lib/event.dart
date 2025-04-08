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
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: [
            EventCard(
              title: 'Wedding',
              date: 'Anytime',
              imageUrl: 'assets/event10.jpg',
              onTap: () => Navigator.pushNamed(context, AppRoutes.booknow),
            ),
            EventCard(
              title: 'Birthday',
              date: 'Anytime',
              imageUrl: 'assets/event11.jpg',
              onTap: () => Navigator.pushNamed(context, AppRoutes.booknow),
            ),
            EventCard(
              title: 'Home Party',
              date: 'Anytime',
              imageUrl: 'assets/event12.jpg',
              onTap: () => Navigator.pushNamed(context, AppRoutes.booknow),
            ),
            EventCard(
              title: 'Picnic',
              date: 'June 15, 2025',
              imageUrl: 'assets/event13.jpg',
              onTap: () => Navigator.pushNamed(context, AppRoutes.booknow),
            ),
            EventCard(
              title: 'Music Festival',
              date: 'June 15, 2025',
              imageUrl: 'assets/event1.png',
              onTap: () => Navigator.pushNamed(context, AppRoutes.booknow),
            ),
            EventCard(
              title: 'Food Festival',
              date: 'June 15, 2025',
              imageUrl: 'assets/event2.jpg',
              onTap: () => Navigator.pushNamed(context, AppRoutes.booknow),
            ),
            EventCard(
              title: 'Business Meetup',
              date: 'June 15, 2025',
              imageUrl: 'assets/event3.jpg',
              onTap: () => Navigator.pushNamed(context, AppRoutes.booknow),
            ),
            EventCard(
              title: 'Corporate Event',
              date: 'June 15, 2025',
              imageUrl: 'assets/event4.jpg',
              onTap: () => Navigator.pushNamed(context, AppRoutes.booknow),
            ),
          ],
        ),
      ),
    );
  }
}
