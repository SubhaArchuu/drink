import 'package:flutter/material.dart';

import '../common/asset_image_path.dart';

class AppbarWidget extends StatelessWidget {
  final String title;
  final Widget child;
  final bool search;
  final bool profile;

  const AppbarWidget({super.key, required this.title, required this.child,required this.search,required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              backgroundImage: AssetImage(AssetImgPath
                  .userProfile),
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
