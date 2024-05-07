
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.grey,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Add your notification icon onPressed functionality here
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Add your menu onPressed functionality here
              },
            ),
          ],
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/logo.jpg', // Replace 'assets/logo.png' with your logo asset path
                    height: 30, // Adjust the height as needed
                  ),
                  const SizedBox(width: 10), // Add spacing between the logo and the search bar
                ],
              ),
              const SizedBox(height: 8), // Add spacing between the logo row and the search bar
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.grey, // Set the background color of the container
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search...',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.camera_alt),
                              onPressed: () {
                                // Action to perform when camera icon is pressed
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Your App Content Here'),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.image_search_rounded),
                onPressed: () {
                  // Add onPressed functionality for the home icon
                },
              ),
              IconButton(
                icon: const Icon(Icons.history),
                onPressed: () {
                  // Add onPressed functionality for the search icon
                },
              ),
              IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () {
                  // Add onPressed functionality for the favorite icon
                },
              ),
              IconButton(
                icon: const Icon(Icons.explore),
                onPressed: () {
                  // Add onPressed functionality for the notifications icon
                },
              ),
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  // Add onPressed functionality for the profile icon
                },
              ),
            ],
          ),
        ),
      ),
      );
  }
}
