import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        //backgroundColor: Color(0xFF24294b),
        centerTitle: true,
        title: Text(
          "EventMate",
          style: TextStyle(
              color: Colors.white70,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              fontFamily: 'Raleway'),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFF24294b),
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFD4AF37),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xFF24294b),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person,
                      color: Color(0xFFD4AF37),
                      size: 40,
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
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
                Icons.home,
                color: Color(0xFFD4AF37),
              ),
              title: Text(
                "HOME",
                style: TextStyle(
                    color: Color(0xFFD4AF37),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.event_note,
                color: Color(0xFFD4AF37),
              ),
              title: Text(
                "EVENTS",
                style: TextStyle(
                    color: Color(0xFFD4AF37),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.book_online,
                color: Color(0xFFD4AF37),
              ),
              title: Text(
                "BOOK NOW",
                style: TextStyle(
                    color: Color(0xFFD4AF37),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Color(0xFFD4AF37),
              ),
              title: Text(
                "SETTINGS",
                style: TextStyle(
                    color: Color(0xFFD4AF37),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.feedback,
                color: Color(0xFFD4AF37),
              ),
              title: Text(
                "FEEDBACK",
                style: TextStyle(
                    color: Color(0xFFD4AF37),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.abc_sharp,
                color: Color(0xFFD4AF37),
              ),
              title: Text(
                "ABOUT",
                style: TextStyle(
                    color: Color(0xFFD4AF37),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {},
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
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
