import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  final String title;
  final Widget child;
  final bool search;
  final bool profile;

  const AppbarWidget({super.key, required this.title, required this.child,required this.search,required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  backgroundColor: Colors.blue.shade900,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.deepPurple,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          if (search) IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // TODO: Add search functionality
            },
          ),
          if (profile) Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/user_profile.png"),
              radius: 18,
              backgroundColor: Colors.white
            ),
          ),
        ],
      ),
      body: child, // Screen-specific content
    );
  }
}
