import 'package:flutter/material.dart';
import 'package:project/routes.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List<String> images = [
    'assets/image1.jpg', // Replace with actual image paths
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.jpg',
    'assets/image5.jpeg',
  ];

  final PageController controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        //backgroundColor: Color(0xFF24294b),
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
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.feedback);
              },
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            // Image Carousel
            SizedBox(
              height: 196,
              width: double.infinity,
              child: PageView.builder(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index % images.length;
                  });
                },
                //itemCount: images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          images[index % images.length],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // child: ClipRRect(
                    //   borderRadius: BorderRadius.circular(12),
                    //   child: Image.asset(
                    //     images[index],
                    //     fit: BoxFit.cover,
                    //     width: double.infinity,
                    //   ),
                    // ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < images.length; i++)
                  buildIndicator(currentIndex == i)
              ],
            ),
            Container(
              margin: EdgeInsets.all(0),
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.jumpToPage(currentIndex - 1);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.jumpToPage(currentIndex + 1);
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )
            // Page Indicator
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: List.generate(
            //     images.length,
            //       (index) =>
            //     // (index) => Container(
            //     //   margin: const EdgeInsets.symmetric(horizontal: 4),
            //     //   width: currentIndex == index ? 12 : 8,
            //     //   height: currentIndex == index ? 12 : 8,
            //     //   decoration: BoxDecoration(
            //     //     color: currentIndex == index ? Colors.amber : Colors.grey,
            //     //     shape: BoxShape.circle,
            //     //   ),
            //     // ),
            //   ),
            // ),
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
