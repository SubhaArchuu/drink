import 'dart:ui';

import 'package:drink_control/screens/bottom_menu/modules.dart';
import 'package:drink_control/screens/bottom_menu/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/strings.dart';
import '../../widgets/appbar.dart';
import 'drink_less_dashboard.dart';



class DrinkBuddyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      AppbarWidget(
        title: Strings.drink_buddy_screen,
        search: false,
        profile: false,
        child: Container(
          decoration:  BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue.shade900, Colors.deepPurple.shade900],
            ),

          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 50), // Adjust spacing

              _glassContainer(child: _welcomeMessage()),
              SizedBox(height: 10),
              _quickLinks(context),

            ],
          ),
        ),
      );
  }

  // Welcome Message
  Widget _welcomeMessage() {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hey there, Welcome back!",
                style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text("Please find useful quick links below.",
                style: TextStyle(fontSize: 14, color: Colors.white70)),
          ],
        ),

    );
  }

  Widget _glassContainer({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15), // Blur effect
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1), // Transparent white with opacity
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.2)), // Subtle border
            ),
            child: child,
          ),
        ),
      ),
    );
  }
  // Quick Links Section
  Widget _quickLinks(BuildContext context) {
    return Column(
      children: [
        _quickLinkItem(Icons.dashboard, "My Dashboard", () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DrinkLessDashboard()),
          );
        }),
        _quickLinkItem(Icons.book, "My Training Modules", () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ModuleScreen()),
          );
        }),
        _quickLinkItem(Icons.person, "My Profile", () {
          navigateWithSlide(context, ProfileScreen()); // Using slide animation
        }),
        TextButton(
          onPressed: () {},
          child: Text("Show more options",  style: TextStyle(fontSize: 14, color: Colors.white70)),
        ),
      ],
    );
  }

  // Quick Link Item
  Widget _quickLinkItem(IconData icon, String title, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.blue),
          title: Text(title, style: TextStyle(fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: onTap,
        ),
      ),
    );

  }

  void navigateWithSlide(BuildContext context, Widget page) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Slide from right
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

}
