import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'bottom_menu/calendar.dart';
import 'bottom_menu/drink_buddy.dart';
import 'bottom_menu/modules.dart';
import 'bottom_menu/profile.dart';
import 'bottom_menu/drink_less_dashboard.dart';


class BottomNavScreen extends StatelessWidget {
  final List<Widget> _screens = [
    DrinkLessDashboard(),
    ModuleScreen(),
    DrinkBuddyScreen(),
    CalendarScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: _screens[state.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting, // Fixed
            backgroundColor: Colors.transparent,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            currentIndex: state.selectedIndex,
            onTap: (index) {
              context.read<BottomNavigationBloc>().add(ChangeTabEvent(index));
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",backgroundColor: Colors.white),
              BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Modules",backgroundColor: Colors.white),
              BottomNavigationBarItem(icon: Icon(Icons.group), label: "Drink Buddy",backgroundColor: Colors.white),
              BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Calendar",backgroundColor: Colors.white),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile",backgroundColor: Colors.white),
            ],
          ),
        );
      },
    );
  }
}
